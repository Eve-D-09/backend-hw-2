// const express = require("express");
// const asyncMySQL = require("../mysql/connection");
// const router = express.Router();

// router.delete("/car/:id", async (req, res) => {
//   const id = Number(req.params.id);

//   if (Number.isNaN(id)) {
//     res.send({ status: 0, reason: "Invalid id" });
//     return;
//   }

//   await asyncMySQL(`DELETE FROM cars WHERE id LIKE ${id};`);
//   res.send({ status: 1 });
// });

// module.exports = router;

//  not usefull anymore
