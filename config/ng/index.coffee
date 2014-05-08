# Angular, server-side pages
exports.main = (req, res) ->
  page = req.params.page || 'index'
  res.render('ng/index/'+page)

exports.partials = (req, res) ->
  view = req.params.view
  action = req.params.action || view
  res.render('ng/client/'+view+'/'+action)

