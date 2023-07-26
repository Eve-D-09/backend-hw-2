// const express = require("express");
// const router = express.Router();
// const asyncMySQL = require("../mysql/connection");

// router.patch("/car/:id", async (req, res) => {
//   console.log(req.body, req.params.id);

//   const transmissionType = ["a", "m"];

//   const id = Number(req.params.id);

//   if (Number.isNaN(id)) {
//     res.send({ status: 0, reason: "Invalid id" });
//     return;
//   }

//   const { make, model, year, transmission } = req.body;

//   try {
//     if (make && typeof make === "string") {
//       await asyncMySQL(`UPDATE cars SET make = "${make}"
//                             WHERE id LIKE "${id}";`);
//     }
//     if (model && typeof model === "string") {
//       await asyncMySQL(`UPDATE cars SET model = "${model}"
//                              WHERE id LIKE "${id}";`);
//     }
//     if (year && typeof year === "number") {
//       await asyncMySQL(`UPDATE cars SET year = "${year}"
//                              WHERE id LIKE "${id}";`);
//     }
//     if (
//       transmission &&
//       typeof transmission === "string" &&
//       transmissionType.includes(transmission)
//     ) {
//       await asyncMySQL(`UPDATE cars SET transmission = "${transmission}"
//     WHERE id LIKE "${id}";`);
//     }
//   } catch (error) {
//     res.send({ status: 0, reason: error.sqlMessage });
//   }
//   res.send({ status: 1 });
// });

// module.exports = router;

//  not usefull anymore
