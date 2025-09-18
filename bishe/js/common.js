(function () {
    (function () {
        var path = location.pathname.substr(1);
        var search = location.search;
        if (search != "") {
            path += decodeURIComponent(search);
        }
        if (path == "") {
            $("#navbar-str li:eq(0)").addClass("active");
        } else {
            $("#navbar-str li").each(function () {
                var href = $(this).find(">a").attr("href");
                if (href == path) {
                    $(this).addClass("active");
                }
                if ($(this).hasClass("dropdown")) {
                    var that = this;
                    $(this)
                        .find("li")
                        .each(function () {
                            var href = $(this).find(">a").attr("href");
                            if (href == path) {
                                $(this).addClass("active");
                                $(that).addClass("active");
                            }
                        });
                }
            });
        }
        console.log(path);
    })();
})();
(function () {
    (function () {
        function selectRadio(obj) {
            var form = $(obj).parents("form");
            var div = $(obj).parent();
            div.find("input").val($(obj).attr("data-value"));
            var isSeach = false;
            $(".search-radio-tree").each(function (i) {
                if (isSeach) {
                    $(this).remove();
                }
                if (this == div[0]) {
                    isSeach = true;
                }
            });
            form.submit();
        }
        window.selectRadio = selectRadio;
        $(".search-radio").each(function () {
            var val = $(this).find("input").val();
            $(this)
                .find('a[data-value="' + val + '"]')
                .addClass("active");
        });
    })();
})();
(function () {
    $(function () {
        function updateCollects(obj) {
            var data = $(obj).data();
            var text = "";
            if (data.isZan > 0) {
                text = data.confirm;
            } else {
                text = data.text;
            }
            text += ' <span class="badge">' + data.count + "</span>";
            $(obj).html(text);
        }
        $(".btn-collects-click").each(function () {
            updateCollects(this);
        });
        $(".btn-collects-click").click(function () {
            var data = $(this).data();
            var url = data.url;
            var index = url.indexOf("?");
            var path = url.substring(0, index);
            var queryString = url.substring(index + 1);
            var that = $(this);
            var obj = this;
            // ajax 方式提交
            $.post(
                path,
                queryString,
                function (res) {
                    if (res.indexOf("已取消") !== -1) {
                        data.count--;
                        data.isZan = 0;
                    } else {
                        data.count++;
                        data.isZan = 1;
                    }
                    that.attr("data-count", data.count).attr("data-is-zan", data.isZan);
                    updateCollects(obj);
                },
                "html"
            );

            // 直接跳转
            //location.href = data.url+'&referer='+encodeURIComponent(location.href);
        });
    });
})();
