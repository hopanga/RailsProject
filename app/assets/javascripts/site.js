$(document).on('ready page:load', function(){

	/* Raty Plugin */
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets',
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });
    /*Raty Plugin End */

    /* elevateZoom Plugin */
    $('.img-zoom').elevateZoom();
    /* elevateZoom Plugin End */
});