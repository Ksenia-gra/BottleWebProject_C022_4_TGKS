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

@route('/about')
@view('about')
def about():
    """Renders the about page."""
    return dict(
        title='Об авторах',
        year=datetime.now().year
    )

@route('/bin_relation_transitivity')
@view('bin_relation_transitivity')
def bin_relation_transitivity():
    """Renders the about page."""
    return dict(
        title='Антитранзитивность бинарного отношения',
        year=datetime.now().year,
        matrix=[],
        vertices=0
    )

@route('/hamiltonian')
@view('hamiltonian_cycle')
def bin_relation_transitivity():
    """Renders the about page."""
    return dict(
        title='Гамильтоновы циклы',
        year=datetime.now().year
    )