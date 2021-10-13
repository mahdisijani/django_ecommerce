Django Ecommerce
======
**We have developed a ecommerce project using the Django and Postgres database.**

Install
-------

**Be sure to use the same version of the code as the version of the docs
you're reading.** You probably want the latest tagged version, but the
default Git version is the master branch. ::

    # clone the repository
    $ git clone https://github.com/mahdisj/django_ecommerce.git
    $ cd django_ecommerce

Create a virtualenv and activate it::

    $ python3 -m venv venv
    $ . venv/bin/activate

Or on Windows cmd::

    $ py -3 -m venv venv
    $ venv\Scripts\activate.bat

Then install the project dependencies with ::

    $ pip install -r requirements.txt

**Notice about Database:**

Before running project:
::
    create a postgres database and import ecommerce_db.sql into database.
    
    config environment variables in sample.env file and rename it to .env.

Run
---

::

    $ python manage.py runserver

Open http://127.0.0.1:8000 in a browser.



