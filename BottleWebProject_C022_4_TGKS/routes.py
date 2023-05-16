"""
Routes and views for the bottle application.
"""

from bottle import route, view
from datetime import datetime

@route('/')
@route('/home')
@route('/index')
@view('index')
def home():
    """Renders the home page."""
    return dict(
        year=datetime.now().year
    )

@route('/contact')
@view('contact')
def contact():
    """Renders the contact page."""
    return dict(
        title='Contact',
        message='Your contact page.',
        year=datetime.now().year
    )

@route('/about')
@view('about')
def about():
    """Renders the about page."""
    return dict(
        title='About',
        message='Your application description page.',
        year=datetime.now().year
    )
@route('/bin_relation_transitivity')
@view('bin_relation_transitivity')
def bin_relation_transitivity():
    """Renders the about page."""
    return dict(
        title='Антитранзитивность бинарного отношения',
        
        year=datetime.now().year
    )
