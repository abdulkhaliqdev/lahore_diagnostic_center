/* HTML document is loaded. DOM is ready.
-------------------------------------------*/

$( document ).ready(function() {

    function NumberFormatter(number) {
        if (number > 1000000) {
            return kendo.toString((number / 1000000), 'n2') + 'M';
        }
        else {
            return kendo.toString(number, 'n0'); // if value < 1000, nothing to do
        }
    }
    function SmallNumberFormatter(number) {
        if (number > 999 && number < 1000000) {
            return kendo.toString((number / 1000), 'n2') + 'K'; // convert to K for number from > 1000 < 1 million
        } else if (number > 1000000) {
            return kendo.toString((number / 1000000), 'n2') + 'M';
        } else if (number < 900) {
            return kendo.toString(number, 'n0'); // if value < 1000, nothing to do
        }
        else {
            return number;
        }
    }

    $(function () {

        /* start typed element */
        //http://stackoverflow.com/questions/24874797/select-div-title-text-and-make-array-with-jquery
        var subElementArray = $.map($('.sub-element'), function (el) { return $(el).text(); });
        $(".element").typed({
            strings: subElementArray,
            typeSpeed: 30,
            contentType: 'html',
            showCursor: false,
            loop: true,
            loopCount: true,
        });
        /* end typed element */

        /* Smooth scroll and Scroll spy (https://github.com/ChrisWojcik/single-page-nav)    
        ---------------------------------------------------------------------------------*/

        $('.templatemo-nav').singlePageNav({
            offset: $(".templatemo-nav").height(),
            filter: ':not(.external)',
            updateHash: false
        });

        /*    $(".spa-nav").on("click", function () {
                let id = $(this).attr("href");
                document.querySelector(id).scrollIntoView({
                    behavior: 'smooth'
                });
            });*/

        /* start navigation top js */
        $(window).scroll(function () {
            let height = $("header").height() + 34;
            if ($(this).scrollTop() > height) {
                $(".templatemo-nav").addClass("sticky");
            }
            else {
                $(".templatemo-nav").removeClass("sticky");
            }
        });

        /* Hide mobile menu after clicking on a link
        -----------------------------------------------*/
        $('.navbar-collapse a').click(function () {
            $(".navbar-collapse").collapse('hide');
        });
        /* end navigation top js */

        $('body').bind('touchstart', function () { });

        $("#dtTo").kendoDatePicker();
        $("#dtFrom").kendoDatePicker();



        /* wow
        -----------------*/
        new WOW().init();
    });

    function caseGridMargin() {
        if (window.innerWidth < 576) {
            $("#casegrid").css("margin-bottom", "15px");
            return 406;
        }
        else if (window.innerWidth > 575 && window.innerWidth < 768) {
            $("#casegrid").css("margin-bottom", "15px");
            return 355;
        }
        else {
            return 325;
        }
    }

    function receiptionCaseGridMargin() {
        if (window.innerWidth < 576) {
            return 410;
        }
        else if (window.innerWidth > 575 && window.innerWidth < 768) {
            return 355;
        }
        else {
            return 325;
        }
    }
    function userGridMargin() {
        if (window.innerWidth < 576) {
            return 335;
        }
        else if (window.innerWidth > 575 && window.innerWidth < 768) {
            return 355;
        }
        else {
            return 250;
        }
    }


    /* start preloader */
    $(window).load(function () {
        $('.preloader').fadeOut(1000); // set duration in brackets    
    });
    /* end preloader */
})