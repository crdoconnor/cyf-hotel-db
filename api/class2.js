const express = require('express');

const router = express.Router();

const pg = require('pg');
const client = new pg.Client({
  user: 'hotelappuser',
  database: 'hotel',
  password: 'password'
});

client.connect();

router.get('/customers', function(req, res) {
  var sql = 'select * from customers';

  client.query(sql, [], (err, result) => {
    res.status(200).json({
      customers: result.rows
    });
  });
});


router.get('/customers/:id', function(req, res) {
  // TODO: add code here
});


router.get('/customers/:surname', function(req, res) {
  // TODO: add code here
});


router.post('/customers/', function(req, res) {
  // EXPECTED JSON Object:
  // {
  //   title: 'Mr',
  //   firstname: 'Laurie',
  //   surname: 'Ainley',
  //   email: 'laurie@ainley.com'
  // }

  // TODO: add code here
});


router.put('/customers/:id', function(req, res) {
  // EXPECTED JSON Object:
  // {
  //   title: 'Mr',
  //   firstname: 'Laurie',
  //   surname: 'Ainley',
  //   email: 'laurie@ainley.com'
  // }

  // TODO: add code here
});


// get '/reservations'
// TODO: add code here


// get '/reservations/:id'
// TODO: add code here


// delete '/reservations/:id'
// TODO: add code here


// get '/reservations/starting-on/:startDate'
// TODO: add code here


// get '/reservations/active-on/:date'
// TODO: add code here


// post '/reservations'
// EXPECTED JSON Object:
// {
//   customer_id: 1,
//   room_id: 1,
//   check_in_date: '2018-01-20',
//   check_out_date: '2018-01-22',
//   room_price: 129.90
// }
// TODO: add code here


// get `/detailed-invoices'
// TODO: add code here


// get `/reservations/details-between/:from_day/:to_day`
// TODO: add code here

module.exports = router;
