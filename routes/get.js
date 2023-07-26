// const express = require("express");
// const router = express.Router();
// const asyncMySQL = require("../mysql/connection");

// //  get all the cars
// router.get("/cars", async (req, res) => {
//   const results =
//     await asyncMySQL(`SELECT make, model, year, transmission, fuel_type, drive, class
//                                         FROM cars `);
//   res.send({ status: 1, results });
// });

// //  to get one specific car
// router.get("/car/:id", async (req, res) => {
//   const id = Number(req.params.id);

//   if (Number.isNaN(id)) {
//     res.send({ status: 0, reason: "Invalid id" });
//     return;
//   }

//   const results =
//     await asyncMySQL(`SELECT make, model, year, transmission, fuel_type, drive, class
//                                         FROM cars 
//                                              WHERE id LIKE ${id};`);

//   if (results.length > 0) {
//     res.send({ status: 1, results });
//     return;
//   }

//   res.send({ status: 0, reason: "Id not found" });
// });

// module.exports = router;
