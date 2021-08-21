// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

require ("bootstrap")
require("packs/Chart")
require("packs/sweetalert")

import $ from 'jquery'
import 'select2'
import 'select2/dist/css/select2.css'

import Swal from 'sweetalert2/dist/sweetalert2.js'
// import 'sweetalert2/src/sweetalert2.scss'
window.Swal = Swal;

window.addEventListener('DOMContentLoaded', () => {
    $('.select2').select2()
    $('.select2-multiple').select2({ multiple: true })
})

import "../stylesheets/application"
import "../stylesheets/loguin"
import "../stylesheets/dashboard"
import "../stylesheets/icons"



document.addEventListener("turbolinks:load", function() {
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
        $('[data-toggle="popover"]').popover()
    })
})


$('.select2').select2()
$('.select2-multiple').select2({ multiple: true })

Rails.start()
Turbolinks.start()
ActiveStorage.start()
