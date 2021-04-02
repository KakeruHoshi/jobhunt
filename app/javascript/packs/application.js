// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

//= require jquery
//= require moment
//= require fullcalendar
import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';

document.addEventListener('turbolinks:load', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new Calendar(calendarEl, {
    plugins: [ dayGridPlugin, interactionPlugin ]
  });

  calendar.render();
});

$(function () {


  $(document).on('turbolinks:load', function (){
    if ($('#calendar').length) {

      function eventCalendar() {
          return $('#calendar').fullCalendar({
          });
      };

      function clearCalendar() {
          $('#calendar').html('');
      };

      $(document).on('turbolinks:load', function () {
        eventCalendar();
      });

      $(document).on('turbolinks:before-cache', clearCalendar);

      $('#calendar').fullCalendar({

        locale: 'ja',
        height: 'auto',
        titleFormat: 'YYYY年 M月',
        dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
        header: {
          left: 'prev,next today',
          center: 'title',
          right: 'month,agendaWeek,agendaDay'
        },
        buttonText: {
          prev: '前',
          next: '次',
          prevYear: '前年',
          nextYear: '翌年',
          today: '今日',
          month: '月',
          week: '週',
          day: '日'
      },
      　timeFormat: "HH:mm",
        navLinks: true,
        selectable: true,
        selectHelper: true,

        timezone: 'UTC',
        editable: true

      });
    };
  });
});
