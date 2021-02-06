require('bootstrap');


$( document ).on('turbolinks:load', function() {
    console.log("It works on each visit!");

    // Clipboard
    var clipboard = new ClipboardJS('button');
    clipboard.on('success', function(e) {
        setTooltip('Copied!');
        hideTooltip();
    });
    clipboard.on('error', function(e) {
        setTooltip('Failed!');
        hideTooltip();
    });

    // Tooltip
    $('button').tooltip({
        trigger: 'click',
        placement: 'bottom'
    });
    function setTooltip(message) {
        $('button').tooltip('hide')
            .attr('data-original-title', message)
            .tooltip('show');
    }
    function hideTooltip() {
        setTimeout(function() {
            $('button').tooltip('hide');
        }, 1000);
    }

});
