const request = require('supertest');
const app = require('../app');

describe('Testes de Integração da API', () => {
  it('Deve retornar status 200 e objeto "ok" na rota de health', async () => {
    const res = await request(app).get('/api/v1/health');
    expect(res.statusCode).toEqual(200);
    expect(res.body).toHaveProperty('status', 'ok');
  });
});