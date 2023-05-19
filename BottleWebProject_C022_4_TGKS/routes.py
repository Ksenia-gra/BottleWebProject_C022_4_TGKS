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
        vertices=0,
        str_assim_antit='',
        rev_matrix=[],
        rev_matr_str=''
    )

@route('/hamiltonian_cycle')
@view('hamiltonian_cycle')
def hamiltonian_cycle():
    """Renders the about page."""
    return dict(
        year=datetime.now().year,
        matrix=[],
        vertices=0
    )

@route('/bin_relation_equality')
@view('bin_relation_equality')
def bin_relation_equality():
    """Renders the about page."""
    return dict(
        title = 'Отношение эквивалентности',
        year = datetime.now().year,
        matrix = [],
        verticesT = 0,
        res = '',
        dopMatrix = []
    )

@route('/maximum_flow')
@view('maximum_flow')
def maximum_flow():
    """Renders the about page."""
    return dict(
        title='Максимальный поток',
        year=datetime.now().year,
        matrix=[],
        vertex=0
    )