const { newSale,getAllSales,getSaleAmountByParameter } = require("../controller/sales");

module.exports = (server) => {
  server.get("/sales", getAllSales);
  server.get("/sales/:params", getSaleAmountByParameter);
  server.post("/sales", newSale);
};