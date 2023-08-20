import supertest from 'supertest';
import app from '../server';
import jwt, { JwtPayload } from 'jsonwebtoken';

type DecodedToken = string | JwtPayload | null;

const request = supertest(app);
let token: string;
let orderId: number;
let productId: number;
let userId1: number;
let userId2: number;

beforeAll((done) => {
  request
    .post('/users')
    .send({
      username: 'testUsername',
      password: 'testPassword',
      firstName: 'testFirstName',
      lastName: 'testLastName',
    })
    .end((err, response) => {
      token = response.body;

      const decoded: DecodedToken = jwt.decode(token as string);
      if (
        typeof decoded !== 'string' &&
        decoded &&
        'user' in decoded &&
        'id' in decoded.user
      ) {
        userId1 = decoded.user.id;
      }

      request
        .post('/products')
        .set('Authorization', `Bearer ${token}`)
        .send({
          name: 'testProduct',
          price: 100
        })
        .end((err, response) => {
          productId = response.body.id;
          done();
        });
    });
});

// ... Hier bleiben die Abschnitte `Users Routes`, `Orders Routes` und `Products Routes` unverändert ...

afterAll((done) => {
  request
    .delete(`/orders/${orderId}/products/${productId}`)
    .set('Authorization', `Bearer ${token}`)
    .end((err1) => {
      if (err1) {
        console.error('Error deleting order product:', err1);
      }

      request
        .delete(`/orders/${orderId}`)
        .set('Authorization', `Bearer ${token}`)
        .end((err2) => {
          if (err2) {
            console.error('Error deleting order:', err2);
          }

          request
            .delete(`/products/${productId}`)
            .set('Authorization', `Bearer ${token}`)
            .end((err3) => {
              if (err3) {
                console.error('Error deleting product:', err3);
              }

              request
                .delete(`/users/${userId1}`)
                .set('Authorization', `Bearer ${token}`)
                .end((err4) => {
                  if (err4) {
                    console.error('Error deleting user:', err4);
                  }
                  done();
                });
            });
        });
    });
});


