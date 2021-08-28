const { getClient, query, queryParams } = require("../db");
function toTimestamp(strDate){
  var datum = Date.parse(strDate);
  return datum/1000;
}

module.exports = {
  newSale: (request, response) => {
    if (request) {
      const sale = {
        userName: request.body.username,
        amount: request.body.amount
      };
  
      getClient((errClient, client) => {
        if (errClient) {
          response.send(503, errClient);
        }
        let currentDate=new Date().toISOString()
        console.log("crueent",currentDate)
        queryParams("INSERT INTO sales (userName,amount,created_at) VALUES ($1, $2,$3);", [sale.userName,sale.amount,currentDate], (err) => {
          // queryParams("INSERT INTO sales (userName,amount,created_at) VALUES ($1, $2,$3);", (err) => {
          client.end();
          let created = true;
          if (err) {
            created = false;
          }
          console.log("sucessful",err)
          if (created) {
            console.log("sucessful")
            response.send(201, { success: created });
          }
          else {
            response.send(200, { success: created });
          }
        }, client);
      });
    }
    else {
      response.send(300);
    }
  },


  /**
   * Capture all sales..
   */
   getAllSales: (request, response) => {
    getClient((errClient, client) => {
      if (errClient) {
        response.send(503, errClient);
      }
  
      query("SELECT * FROM sales;", (err, res) => {
        client.end();
        if (err) {
          response.send(500, err);
        }
        else {
          if (res.rows.length > 0) {
            res = res.rows;
            console.log("res",res[0].created_at)
          }
          response.send(200, res);
        }
      }, client);
    });
  },



  getSaleAmountByParameter: (request, response) => {
    console.log(request.params)
    const parameter = parseInt(request.params.parameter);
  
    getClient((errClient, client) => {
      if (errClient) {
        response.send(503, errClient);
      }
      let query=""
      if(request.params.params==="daily")
         query = "select extract(hour from created_at) as Hour,sum(amount) from sales group by extract(hour from created_at)"
      else if(request.params.params==="weekly")
         query = "select extract(day from created_at) as day,sum(amount) from sales group by extract(day from created_at)"
      else if(request.params.params==="monthly")
         query = "select extract(day from created_at) as day,sum(amount) from sales group by extract(day from created_at)"

      queryParams(query, [], (err, res) => {
        client.end();
        if (err) {
          response.send(500, err);
        }
        else {
          let sales = [];
          if (res.rows.length > 0) {
            console.log(res);
            sales = res.rows;
          }
          response.send(200, sales);
        }
  
      }, client);
    });
  },

}