const { newSale,getAllSales,getSaleAmountByParameter } = require("../controller/sales");

module.exports = (server) => {
  server.get("/sales", getAllSales);

  server.get("/sales/:params", getSaleAmountByParameter);

//   server.post("/user/login", userLogin);

  server.post("/sales", newSale);

//   server.post("/user/edit", editUser);

//   server.del("/user", deleteUser);
};