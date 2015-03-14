$(document).on('ready page:load', function() {
  $('article').readmore();
  $('article').readmore({
    speed: 75,
    moreLink: '<a href="#" class="btn btn-block btn-lg btn-default btn-readmore">더보기</a>',
    lessLink: '<a href="#" class="btn btn-block btn-lg btn-default btn-readmore">숨기기</a>',
    collapsedHeight: 350,
    afterToggle: function(trigger, element, expanded) {
      $('html, body').animate( { scrollTop: $(element).offset().top }, {duration: 100 } );
    }
  });

  $('.contribution-message').readmore();
  $('.contribution-message').readmore({
    speed: 75,
    moreLink: '<a href="#">더보기</a>',
    lessLink: '<a href="#">숨기기</a>',
    collapsedHeight: 40,
    afterToggle: function(trigger, element, expanded) {
      $('html, body').animate( { scrollTop: $(element).offset().top }, {duration: 100 } );
    }
  });
});

 // window.scrollTo(0,document.body.scrollHeight);
