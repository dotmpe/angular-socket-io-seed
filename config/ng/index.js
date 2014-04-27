/*
 * Angular server pages
 */

exports.main = function(req, res){
  var page = req.params.page || 'index';
  res.render('ng/index/'+page);
};

exports.partials = function (req, res) {
  var view = req.params.view
    , action = req.params.action || view;
  res.render('ng/client/'+view+'/'+action);
};
