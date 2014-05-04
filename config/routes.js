/*!
 * Module dependencies.
 */

var async = require('async')

/**
 * Controllers
 */

var users = require('../app/controllers/users')
  , articles = require('../app/controllers/articles')
  , home = require('../app/controllers/home')
  , auth = require('./middlewares/authorization')
  , ngroutes = require('./ng') // loads index.js
  , ngapi = require('./ng/api')

/**
 * Route middlewares
 */

var articleAuth = [auth.requiresLogin, auth.article.hasAuthorization]
var commentAuth = [auth.requiresLogin, auth.comment.hasAuthorization]

/**
 * Expose routes
 */

var redirect = function(path) {
	return function(req, res) {
		res.redirect(path);
	}
}

module.exports = function (app, passport) {

	/* Angular server-side routes */

	// XXX: html5 routing means we have two routers? client vs. server.. 
	// thus need to find proper redirect method, ie /client/index?redir=<name> 
	// also, refreshing/requesting client-side routes result in request to server 
	// and thus default redirect(s) ... 
	/* Front end is not the exciting, just need one page. */
	app.route('/trojan/:page').all(ngroutes.main);
	app.route('/trojan/').all(ngroutes.main);
	app.route('/trojan').all(redirect('/trojan/'));
	/* Angular app (server-side) views */
	app.route('/trojan/view/:view/:action').all(ngroutes.partials);
	// angular api
	app.route('/api/client/name').all(ngapi.name)

  /* Express routes (backend only) */
  /* Home routes */
  app.route('/home').all(home.home)
	app.route('/').all(redirect('/home'))
	app.route(/^\/bower_component\/(.*)$/).all(function(req, res) {
		res.redirect('/components/'+req.params[0]);
	});
  /* User module */
  app.get('/login', users.login)
  app.get('/signup', users.signup)
  app.get('/logout', users.logout)
  app.post('/users', users.create)
  app.post('/users/session',
    passport.authenticate('local', {
      failureRedirect: '/login',
      failureFlash: 'Invalid email or password.'
    }), users.session)
  app.get('/users/:userId', users.show)
  app.get('/auth/facebook',
    passport.authenticate('facebook', {
      scope: [ 'email', 'user_about_me'],
      failureRedirect: '/login'
    }), users.signin)
  app.get('/auth/facebook/callback',
    passport.authenticate('facebook', {
      failureRedirect: '/login'
    }), users.authCallback)
  app.get('/auth/github',
    passport.authenticate('github', {
      failureRedirect: '/login'
    }), users.signin)
  app.get('/auth/github/callback',
    passport.authenticate('github', {
      failureRedirect: '/login'
    }), users.authCallback)
  app.get('/auth/twitter',
    passport.authenticate('twitter', {
      failureRedirect: '/login'
    }), users.signin)
  app.get('/auth/twitter/callback',
    passport.authenticate('twitter', {
      failureRedirect: '/login'
    }), users.authCallback)
  app.get('/auth/google',
    passport.authenticate('google', {
      failureRedirect: '/login',
      scope: [
        'https://www.googleapis.com/auth/userinfo.profile',
        'https://www.googleapis.com/auth/userinfo.email'
      ]
    }), users.signin)
  app.get('/auth/google/callback',
    passport.authenticate('google', {
      failureRedirect: '/login'
    }), users.authCallback)
  app.get('/auth/linkedin',
    passport.authenticate('linkedin', {
      failureRedirect: '/login',
      scope: [
        'r_emailaddress'
      ]
    }), users.signin)
  app.get('/auth/linkedin/callback',
    passport.authenticate('linkedin', {
      failureRedirect: '/login'
    }), users.authCallback)

  app.param('userId', users.user)

  /* Article module */
  app.param('id', articles.load)
  app.get('/articles', articles.index)
  app.get('/articles/new', auth.requiresLogin, articles.new)
  app.post('/articles', auth.requiresLogin, articles.create)
  app.get('/articles/:id', articles.show)
  app.get('/articles/:id/edit', articleAuth, articles.edit)
  app.put('/articles/:id', articleAuth, articles.update)
  app.del('/articles/:id', articleAuth, articles.destroy)

  // comment routes
  var comments = require('../app/controllers/comments')
  app.param('commentId', comments.load)
  app.post('/articles/:id/comments', auth.requiresLogin, comments.create)
  app.get('/articles/:id/comments', auth.requiresLogin, comments.create)
  app.del('/articles/:id/comments/:commentId', commentAuth, comments.destroy)

  // tag routes
  var tags = require('../app/controllers/tags')
  app.get('/tags/:tag', tags.index)

}
