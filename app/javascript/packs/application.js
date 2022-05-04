require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import $ from 'jquery'
import 'bootstrap'
import select2 from 'select2/dist/js/select2';
import "@fortawesome/fontawesome-free/js/all";

import '../stylesheets/application.scss';

$(document).on('turbolinks:load', function() {
    $('#movie_genre_list').select2()
    $('#movie_stars').select2()
    $('#movie_writers').select2()
    $('#movie_directors').select2()
});
