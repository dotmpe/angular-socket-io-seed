/*
 * GET home page.
 */

exports.index = function(req, res){
  res.render('ng/index');
};

exports.partials = function (req, res) {
  var name = req.params.name;
  res.render('ng/partials/' + name);
};
