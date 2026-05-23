const express = require('express');
const app = express();

app.use(express.json());

// Rota de Health Check para validação do monitoramento
app.get('/api/v1/health', (req, res) => {
  res.status(200).json({ status: 'ok' });
});

module.exports = app;

if (require.main === module) {
  const PORT = process.env.PORT || 3000;
  app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
  });
}