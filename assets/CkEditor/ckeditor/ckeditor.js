/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

!function () {
    if (window.CKEDITOR && window.CKEDITOR.dom) return;
    if (!window.CKEDITOR) window.CKEDITOR = function () {
        var a = {
            timestamp: "C9A85WF",
            version: "3.6.5",
            revision: "7647",
            rnd: Math.floor(900 * Math.random()) + 100,
            _: {},
            status: "unloaded",
            basePath: function () {
                var a = window.CKEDITOR_BASEPATH || "";
                if (!a) {
                    var b = document.getElementsByTagName("script");
                    for (var c = 0; c < b.length; c++) {
                        var d = b[c].src.match(/(^|.*[\\\/])ckeditor(?:_basic)?(?:_source)?.js(?:\?.*)?$/i);
                        if (d) {
                            a = d[1];
                            break;
                        }
                    }
                }
                if (a.indexOf(":/") == -1) if (0 === a.indexOf("/")) a = location.href.match(/^.*?:\/\/[^\/]*/)[0] + a; else a = location.href.match(/^[^\?]*\/(?:)/)[0] + a;
                if (!a) throw 'The CKEditor installation path could not be automatically detected. Please set the global variable "CKEDITOR_BASEPATH" before creating editor instances.';
                return a;
            }(),
            getUrl: function (a) {
                if (a.indexOf(":/") == -1 && 0 !== a.indexOf("/")) a = this.basePath + a;
                if (this.timestamp && "/" != a.charAt(a.length - 1) && !/[&?]t=/.test(a)) a += (a.indexOf("?") >= 0 ? "&" : "?") + "t=" + this.timestamp;
                return a;
            }
        }, b = window.CKEDITOR_GETURL;
        if (b) {
            var c = a.getUrl;
            a.getUrl = function (d) {
                return b.call(a, d) || c.call(a, d);
            };
        }
        return a;
    }();
    var a = CKEDITOR;
    if (!a.event) {
        a.event = function () { };
        a.event.implementOn = function (b) {
            var c = a.event.prototype;
            for (var d in c) if (void 0 == b[d]) b[d] = c[d];
        };
        a.event.prototype = function () {
            var a = function (a) {
                var b = a.getPrivate && a.getPrivate() || a._ || (a._ = {});
                return b.events || (b.events = {});
            }, b = function (a) {
                this.name = a;
                this.listeners = [];
            };
            b.prototype = {
                getListenerIndex: function (a) {
                    for (var b = 0, c = this.listeners; b < c.length; b++) if (c[b].fn == a) return b;
                    return -1;
                }
            };
            return {
                on: function (c, d, e, f, g) {
                    var h = a(this), i = h[c] || (h[c] = new b(c));
                    if (i.getListenerIndex(d) < 0) {
                        var j = i.listeners;
                        if (!e) e = this;
                        if (isNaN(g)) g = 10;
                        var k = this, l = function (a, b, g, h) {
                            var i = {
                                name: c,
                                sender: this,
                                editor: a,
                                data: b,
                                listenerData: f,
                                stop: g,
                                cancel: h,
                                removeListener: function () {
                                    k.removeListener(c, d);
                                }
                            };
                            d.call(e, i);
                            return i.data;
                        };
                        l.fn = d;
                        l.priority = g;
                        for (var m = j.length - 1; m >= 0; m--) if (j[m].priority <= g) {
                            j.splice(m + 1, 0, l);
                            return;
                        }
                        j.unshift(l);
                    }
                },
                fire: function () {
                    var b = false, c = function () {
                        b = true;
                    }, d = false, e = function () {
                        d = true;
                    };
                    return function (f, g, h) {
                        var i = a(this)[f], j = b, k = d;
                        b = d = false;
                        if (i) {
                            var l = i.listeners;
                            if (l.length) {
                                l = l.slice(0);
                                for (var m = 0; m < l.length; m++) {
                                    var n = l[m].call(this, h, g, c, e);
                                    if ("undefined" != typeof n) g = n;
                                    if (b || d) break;
                                }
                            }
                        }
                        var o = d || ("undefined" == typeof g ? false : g);
                        b = j;
                        d = k;
                        return o;
                    };
                }(),
                fireOnce: function (b, c, d) {
                    var e = this.fire(b, c, d);
                    delete a(this)[b];
                    return e;
                },
                removeListener: function (b, c) {
                    var d = a(this)[b];
                    if (d) {
                        var e = d.getListenerIndex(c);
                        if (e >= 0) d.listeners.splice(e, 1);
                    }
                },
                hasListeners: function (b) {
                    var c = a(this)[b];
                    return c && c.listeners.length > 0;
                }
            };
        }();
    }
    if (!a.editor) {
        a.ELEMENT_MODE_NONE = 0;
        a.ELEMENT_MODE_REPLACE = 1;
        a.ELEMENT_MODE_APPENDTO = 2;
        a.editor = function (b, c, d, e) {
            var f = this;
            f._ = {
                instanceConfig: b,
                element: c,
                data: e
            };
            f.elementMode = d || 0;
            a.event.call(f);
            f._init();
        };
        a.editor.replace = function (b, c) {
            var d = b;
            if ("object" != typeof d) {
                d = document.getElementById(b);
                if (d && d.tagName.toLowerCase() in {
                    style: 1,
                    script: 1,
                    base: 1,
                    link: 1,
                    meta: 1,
                    title: 1
                }) d = null;
                if (!d) {
                    var e = 0, f = document.getElementsByName(b);
                    while ((d = f[e++]) && "textarea" != d.tagName.toLowerCase());
                }
                if (!d) throw '[CKEDITOR.editor.replace] The element with id or name "' + b + '" was not found.';
            }
            d.style.visibility = "hidden";
            return new a.editor(c, d, 1);
        };
        a.editor.appendTo = function (b, c, d) {
            var e = b;
            if ("object" != typeof e) {
                e = document.getElementById(b);
                if (!e) throw '[CKEDITOR.editor.appendTo] The element with id "' + b + '" was not found.';
            }
            return new a.editor(c, e, 2, d);
        };
        a.editor.prototype = {
            _init: function () {
                var b = a.editor._pending || (a.editor._pending = []);
                b.push(this);
            },
            fire: function (b, c) {
                return a.event.prototype.fire.call(this, b, c, this);
            },
            fireOnce: function (b, c) {
                return a.event.prototype.fireOnce.call(this, b, c, this);
            }
        };
        a.event.implementOn(a.editor.prototype, true);
    }
    if (!a.env) a.env = function () {
        var a = navigator.userAgent.toLowerCase(), b = window.opera, c = {
            ie: false,
            opera: !!b && b.version,
            webkit: a.indexOf(" applewebkit/") > -1,
            air: a.indexOf(" adobeair/") > -1,
            mac: a.indexOf("macintosh") > -1,
            quirks: "BackCompat" == document.compatMode,
            mobile: a.indexOf("mobile") > -1,
            iOS: /(ipad|iphone|ipod)/.test(a),
            isCustomDomain: function () {
                if (!this.ie) return false;
                var a = document.domain, b = window.location.hostname;
                return a != b && a != "[" + b + "]";
            },
            secure: "https:" == location.protocol
        };
        c.gecko = "Gecko" == navigator.product && !c.webkit && !c.opera;
        var d = 0;
        if (c.ie) {
            d = parseFloat(a.match(/msie (\d+)/)[1]);
            c.ie8 = !!document.documentMode;
            c.ie8Compat = 8 == document.documentMode;
            c.ie9Compat = 9 == document.documentMode;
            c.ie7Compat = 7 == d && !document.documentMode || 7 == document.documentMode;
            c.ie6Compat = d < 7 || c.quirks;
        }
        if (c.gecko) {
            var e = a.match(/rv:([\d\.]+)/);
            if (e) {
                e = e[1].split(".");
                d = 1e4 * e[0] + 100 * (e[1] || 0) + +(e[2] || 0);
            }
        }
        if (c.opera) d = parseFloat(b.version());
        if (c.air) d = parseFloat(a.match(/ adobeair\/(\d+)/)[1]);
        if (c.webkit) d = parseFloat(a.match(/ applewebkit\/(\d+)/)[1]);
        c.version = d;
        c.isCompatible = c.iOS && d >= 534 || !c.mobile && (c.ie && d >= 6 || c.gecko && d >= 10801 || c.opera && d >= 9.5 || c.air && d >= 1 || c.webkit && d >= 522 || false);
        c.cssClass = "cke_browser_" + (c.ie ? "ie" : c.gecko ? "gecko" : c.opera ? "opera" : c.webkit ? "webkit" : "unknown");
        if (c.quirks) c.cssClass += " cke_browser_quirks";
        if (c.ie) {
            c.cssClass += " cke_browser_ie" + (c.version < 7 ? "6" : c.version >= 8 ? document.documentMode : "7");
            if (c.quirks) c.cssClass += " cke_browser_iequirks";
        }
        if (c.gecko && d < 10900) c.cssClass += " cke_browser_gecko18";
        if (c.air) c.cssClass += " cke_browser_air";
        return c;
    }();
    var b = a.env;
    var c = b.ie;
    if ("unloaded" == a.status) (function () {
        a.event.implementOn(a);
        a.loadFullCore = function () {
            if ("basic_ready" != a.status) {
                a.loadFullCore._load = 1;
                return;
            }
            delete a.loadFullCore;
            var b = document.createElement("script");
            b.type = "text/javascript";
            b.src = a.basePath + "ckeditor.js";
            document.getElementsByTagName("head")[0].appendChild(b);
        };
        a.loadFullCoreTimeout = 0;
        a.replaceClass = "ckeditor";
        a.replaceByClassEnabled = 1;
        var c = function (c, d, e, f) {
            if (b.isCompatible) {
                if (a.loadFullCore) a.loadFullCore();
                var g = e(c, d, f);
                a.add(g);
                return g;
            }
            return null;
        };
        a.replace = function (b, d) {
            return c(b, d, a.editor.replace);
        };
        a.appendTo = function (b, d, e) {
            return c(b, d, a.editor.appendTo, e);
        };
        a.add = function (a) {
            var b = this._.pending || (this._.pending = []);
            b.push(a);
        };
        a.replaceAll = function () {
            var a = document.getElementsByTagName("textarea");
            for (var b = 0; b < a.length; b++) {
                var c = null, d = a[b];
                if (!d.name && !d.id) continue;
                if ("string" == typeof arguments[0]) {
                    var e = new RegExp("(?:^|\\s)" + arguments[0] + "(?:$|\\s)");
                    if (!e.test(d.className)) continue;
                } else if ("function" == typeof arguments[0]) {
                    c = {};
                    if (false === arguments[0](d, c)) continue;
                }
                this.replace(d, c);
            }
        };
        !function () {
            var b = function () {
                var b = a.loadFullCore, c = a.loadFullCoreTimeout;
                if (a.replaceByClassEnabled) a.replaceAll(a.replaceClass);
                a.status = "basic_ready";
                if (b && b._load) b(); else if (c) setTimeout(function () {
                    if (a.loadFullCore) a.loadFullCore();
                }, 1e3 * c);
            };
            if (window.addEventListener) window.addEventListener("load", b, false); else if (window.attachEvent) window.attachEvent("onload", b);
        }();
        a.status = "basic_loaded";
    })();
    a.dom = {};
    var d = a.dom;
    !function () {
        var b = [];
        a.on("reset", function () {
            b = [];
        });
        a.tools = {
            arrayCompare: function (a, b) {
                if (!a && !b) return true;
                if (!a || !b || a.length != b.length) return false;
                for (var c = 0; c < a.length; c++) if (a[c] != b[c]) return false;
                return true;
            },
            clone: function (a) {
                var b;
                if (a && a instanceof Array) {
                    b = [];
                    for (var c = 0; c < a.length; c++) b[c] = this.clone(a[c]);
                    return b;
                }
                if (null === a || "object" != typeof a || a instanceof String || a instanceof Number || a instanceof Boolean || a instanceof Date || a instanceof RegExp) return a;
                b = new a.constructor();
                for (var d in a) {
                    var e = a[d];
                    b[d] = this.clone(e);
                }
                return b;
            },
            capitalize: function (a) {
                return a.charAt(0).toUpperCase() + a.substring(1).toLowerCase();
            },
            extend: function (a) {
                var b = arguments.length, c, d;
                if ("boolean" == typeof (c = arguments[b - 1])) b--; else if ("boolean" == typeof (c = arguments[b - 2])) {
                    d = arguments[b - 1];
                    b -= 2;
                }
                for (var e = 1; e < b; e++) {
                    var f = arguments[e];
                    for (var g in f) if (true === c || void 0 == a[g]) if (!d || g in d) a[g] = f[g];
                }
                return a;
            },
            prototypedCopy: function (a) {
                var b = function () { };
                b.prototype = a;
                return new b();
            },
            isArray: function (a) {
                return !!a && a instanceof Array;
            },
            isEmpty: function (a) {
                for (var b in a) if (a.hasOwnProperty(b)) return false;
                return true;
            },
            cssStyleToDomStyle: function () {
                var a = document.createElement("div").style, b = "undefined" != typeof a.cssFloat ? "cssFloat" : "undefined" != typeof a.styleFloat ? "styleFloat" : "float";
                return function (a) {
                    if ("float" == a) return b; else return a.replace(/-./g, function (a) {
                        return a.substr(1).toUpperCase();
                    });
                };
            }(),
            buildStyleHtml: function (a) {
                a = [].concat(a);
                var b, c = [];
                for (var d = 0; d < a.length; d++) {
                    b = a[d];
                    if (/@import|[{}]/.test(b)) c.push("<style>" + b + "</style>"); else c.push('<link type="text/css" rel=stylesheet href="' + b + '">');
                }
                return c.join("");
            },
            htmlEncode: function (a) {
                var b = function (a) {
                    var b = new d.element("span");
                    b.setText(a);
                    return b.getHtml();
                }, c = "<br>" == b("\n").toLowerCase() ? function (a) {
                    return b(a).replace(/<br>/gi, "\n");
                } : b, e = ">" == b(">") ? function (a) {
                    return c(a).replace(/>/g, "&gt;");
                } : c, f = "&nbsp; " == b("  ") ? function (a) {
                    return e(a).replace(/&nbsp;/g, " ");
                } : e;
                this.htmlEncode = f;
                return this.htmlEncode(a);
            },
            htmlEncodeAttr: function (a) {
                return a.replace(/"/g, "&quot;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            },
            getNextNumber: function () {
                var a = 0;
                return function () {
                    return ++a;
                };
            }(),
            getNextId: function () {
                return "cke_" + this.getNextNumber();
            },
            override: function (a, b) {
                return b(a);
            },
            setTimeout: function (a, b, c, d, e) {
                if (!e) e = window;
                if (!c) c = e;
                return e.setTimeout(function () {
                    if (d) a.apply(c, [].concat(d)); else a.apply(c);
                }, b || 0);
            },
            trim: function () {
                var a = /(?:^[ \t\n\r]+)|(?:[ \t\n\r]+$)/g;
                return function (b) {
                    return b.replace(a, "");
                };
            }(),
            ltrim: function () {
                var a = /^[ \t\n\r]+/g;
                return function (b) {
                    return b.replace(a, "");
                };
            }(),
            rtrim: function () {
                var a = /[ \t\n\r]+$/g;
                return function (b) {
                    return b.replace(a, "");
                };
            }(),
            indexOf: Array.prototype.indexOf ? function (a, b) {
                return a.indexOf(b);
            } : function (a, b) {
                for (var c = 0, d = a.length; c < d; c++) if (a[c] === b) return c;
                return -1;
            },
            bind: function (a, b) {
                return function () {
                    return a.apply(b, arguments);
                };
            },
            createClass: function (b) {
                var c = b.$, d = b.base, e = b.privates || b._, f = b.proto, g = b.statics;
                if (e) {
                    var h = c;
                    c = function () {
                        var b = this;
                        var c = b._ || (b._ = {});
                        for (var d in e) {
                            var f = e[d];
                            c[d] = "function" == typeof f ? a.tools.bind(f, b) : f;
                        }
                        h.apply(b, arguments);
                    };
                }
                if (d) {
                    c.prototype = this.prototypedCopy(d.prototype);
                    c.prototype["constructor"] = c;
                    c.prototype.base = function () {
                        this.base = d.prototype.base;
                        d.apply(this, arguments);
                        this.base = arguments.callee;
                    };
                }
                if (f) this.extend(c.prototype, f, true);
                if (g) this.extend(c, g, true);
                return c;
            },
            addFunction: function (a, c) {
                return b.push(function () {
                    return a.apply(c || this, arguments);
                }) - 1;
            },
            removeFunction: function (a) {
                b[a] = null;
            },
            callFunction: function (a) {
                var c = b[a];
                return c && c.apply(window, Array.prototype.slice.call(arguments, 1));
            },
            cssLength: function () {
                return function (a) {
                    return a + (!a || isNaN(Number(a)) ? "" : "px");
                };
            }(),
            convertToPx: function () {
                var b;
                return function (c) {
                    if (!b) {
                        b = d.element.createFromHtml('<div style="position:absolute;left:-9999px;top:-9999px;margin:0px;padding:0px;border:0px;"></div>', a.document);
                        a.document.getBody().append(b);
                    }
                    if (!/%$/.test(c)) {
                        b.setStyle("width", c);
                        return b.$.clientWidth;
                    }
                    return c;
                };
            }(),
            repeat: function (a, b) {
                return new Array(b + 1).join(a);
            },
            tryThese: function () {
                var a;
                for (var b = 0, c = arguments.length; b < c; b++) {
                    var d = arguments[b];
                    try {
                        a = d();
                        break;
                    } catch (e) { }
                }
                return a;
            },
            genKey: function () {
                return Array.prototype.slice.call(arguments).join("-");
            },
            normalizeCssText: function (b, c) {
                var d = [], e, f = a.tools.parseCssText(b, true, c);
                for (e in f) d.push(e + ":" + f[e]);
                d.sort();
                return d.length ? d.join(";") + ";" : "";
            },
            convertRgbToHex: function (a) {
                return a.replace(/(?:rgb\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\))/gi, function (a, b, c, d) {
                    var e = [b, c, d];
                    for (var f = 0; f < 3; f++) e[f] = ("0" + parseInt(e[f], 10).toString(16)).slice(-2);
                    return "#" + e.join("");
                });
            },
            parseCssText: function (b, c, e) {
                var f = {};
                if (e) {
                    var g = new d.element("span");
                    g.setAttribute("style", b);
                    b = a.tools.convertRgbToHex(g.getAttribute("style") || "");
                }
                if (!b || ";" == b) return f;
                b.replace(/&quot;/g, '"').replace(/\s*([^:;\s]+)\s*:\s*([^;]+)\s*(?=;|$)/g, function (b, d, e) {
                    if (c) {
                        d = d.toLowerCase();
                        if ("font-family" == d) e = e.toLowerCase().replace(/["']/g, "").replace(/\s*,\s*/g, ",");
                        e = a.tools.trim(e);
                    }
                    f[d] = e;
                });
                return f;
            }
        };
    }();
    var e = a.tools;
    a.dtd = function () {
        var a = e.extend, b = {
            isindex: 1,
            fieldset: 1
        }, c = {
            input: 1,
            button: 1,
            select: 1,
            textarea: 1,
            label: 1
        }, d = a({
            a: 1
        }, c), f = a({
            iframe: 1
        }, d), g = {
            hr: 1,
            ul: 1,
            menu: 1,
            div: 1,
            section: 1,
            header: 1,
            footer: 1,
            nav: 1,
            article: 1,
            aside: 1,
            figure: 1,
            dialog: 1,
            hgroup: 1,
            mark: 1,
            time: 1,
            meter: 1,
            command: 1,
            keygen: 1,
            output: 1,
            progress: 1,
            audio: 1,
            video: 1,
            details: 1,
            datagrid: 1,
            datalist: 1,
            blockquote: 1,
            noscript: 1,
            table: 1,
            center: 1,
            address: 1,
            dir: 1,
            pre: 1,
            h5: 1,
            dl: 1,
            h4: 1,
            noframes: 1,
            h6: 1,
            ol: 1,
            h1: 1,
            h3: 1,
            h2: 1
        }, h = {
            ins: 1,
            del: 1,
            script: 1,
            style: 1
        }, i = a({
            b: 1,
            acronym: 1,
            bdo: 1,
            "var": 1,
            "#": 1,
            abbr: 1,
            code: 1,
            br: 1,
            i: 1,
            cite: 1,
            kbd: 1,
            u: 1,
            strike: 1,
            s: 1,
            tt: 1,
            strong: 1,
            q: 1,
            samp: 1,
            em: 1,
            dfn: 1,
            span: 1,
            wbr: 1
        }, h), j = a({
            sub: 1,
            img: 1,
            object: 1,
            sup: 1,
            basefont: 1,
            map: 1,
            applet: 1,
            font: 1,
            big: 1,
            small: 1,
            mark: 1
        }, i), k = a({
            p: 1
        }, j), l = a({
            iframe: 1
        }, j, c), m = {
            img: 1,
            noscript: 1,
            br: 1,
            kbd: 1,
            center: 1,
            button: 1,
            basefont: 1,
            h5: 1,
            h4: 1,
            samp: 1,
            h6: 1,
            ol: 1,
            h1: 1,
            h3: 1,
            h2: 1,
            form: 1,
            font: 1,
            "#": 1,
            select: 1,
            menu: 1,
            ins: 1,
            abbr: 1,
            label: 1,
            code: 1,
            table: 1,
            script: 1,
            cite: 1,
            input: 1,
            iframe: 1,
            strong: 1,
            textarea: 1,
            noframes: 1,
            big: 1,
            small: 1,
            span: 1,
            hr: 1,
            sub: 1,
            bdo: 1,
            "var": 1,
            div: 1,
            section: 1,
            header: 1,
            footer: 1,
            nav: 1,
            article: 1,
            aside: 1,
            figure: 1,
            dialog: 1,
            hgroup: 1,
            mark: 1,
            time: 1,
            meter: 1,
            menu: 1,
            command: 1,
            keygen: 1,
            output: 1,
            progress: 1,
            audio: 1,
            video: 1,
            details: 1,
            datagrid: 1,
            datalist: 1,
            object: 1,
            sup: 1,
            strike: 1,
            dir: 1,
            map: 1,
            dl: 1,
            applet: 1,
            del: 1,
            isindex: 1,
            fieldset: 1,
            ul: 1,
            b: 1,
            acronym: 1,
            a: 1,
            blockquote: 1,
            i: 1,
            u: 1,
            s: 1,
            tt: 1,
            address: 1,
            q: 1,
            pre: 1,
            p: 1,
            em: 1,
            dfn: 1
        }, n = a({
            a: 1
        }, l), o = {
            tr: 1
        }, p = {
            "#": 1
        }, q = a({
            param: 1
        }, m), r = a({
            form: 1
        }, b, f, g, k), s = {
            li: 1
        }, t = {
            style: 1,
            script: 1
        }, u = {
            base: 1,
            link: 1,
            meta: 1,
            title: 1
        }, v = a(u, t), w = {
            head: 1,
            body: 1
        }, x = {
            html: 1
        }, y = {
            address: 1,
            blockquote: 1,
            center: 1,
            dir: 1,
            div: 1,
            section: 1,
            header: 1,
            footer: 1,
            nav: 1,
            article: 1,
            aside: 1,
            figure: 1,
            dialog: 1,
            hgroup: 1,
            time: 1,
            meter: 1,
            menu: 1,
            command: 1,
            keygen: 1,
            output: 1,
            progress: 1,
            audio: 1,
            video: 1,
            details: 1,
            datagrid: 1,
            datalist: 1,
            dl: 1,
            fieldset: 1,
            form: 1,
            h1: 1,
            h2: 1,
            h3: 1,
            h4: 1,
            h5: 1,
            h6: 1,
            hr: 1,
            isindex: 1,
            noframes: 1,
            ol: 1,
            p: 1,
            pre: 1,
            table: 1,
            ul: 1
        };
        return {
            $nonBodyContent: a(x, w, u),
            $block: y,
            $blockLimit: {
                body: 1,
                div: 1,
                section: 1,
                header: 1,
                footer: 1,
                nav: 1,
                article: 1,
                aside: 1,
                figure: 1,
                dialog: 1,
                hgroup: 1,
                time: 1,
                meter: 1,
                menu: 1,
                command: 1,
                keygen: 1,
                output: 1,
                progress: 1,
                audio: 1,
                video: 1,
                details: 1,
                datagrid: 1,
                datalist: 1,
                td: 1,
                th: 1,
                caption: 1,
                form: 1
            },
            $inline: n,
            $body: a({
                script: 1,
                style: 1
            }, y),
            $cdata: {
                script: 1,
                style: 1
            },
            $empty: {
                area: 1,
                base: 1,
                br: 1,
                col: 1,
                hr: 1,
                img: 1,
                input: 1,
                link: 1,
                meta: 1,
                param: 1,
                wbr: 1
            },
            $listItem: {
                dd: 1,
                dt: 1,
                li: 1
            },
            $list: {
                ul: 1,
                ol: 1,
                dl: 1
            },
            $nonEditable: {
                applet: 1,
                button: 1,
                embed: 1,
                iframe: 1,
                map: 1,
                object: 1,
                option: 1,
                script: 1,
                textarea: 1,
                param: 1,
                audio: 1,
                video: 1
            },
            $captionBlock: {
                caption: 1,
                legend: 1
            },
            $removeEmpty: {
                abbr: 1,
                acronym: 1,
                address: 1,
                b: 1,
                bdo: 1,
                big: 1,
                cite: 1,
                code: 1,
                del: 1,
                dfn: 1,
                em: 1,
                font: 1,
                i: 1,
                ins: 1,
                label: 1,
                kbd: 1,
                q: 1,
                s: 1,
                samp: 1,
                small: 1,
                span: 1,
                strike: 1,
                strong: 1,
                sub: 1,
                sup: 1,
                tt: 1,
                u: 1,
                "var": 1,
                mark: 1
            },
            $tabIndex: {
                a: 1,
                area: 1,
                button: 1,
                input: 1,
                object: 1,
                select: 1,
                textarea: 1
            },
            $tableContent: {
                caption: 1,
                col: 1,
                colgroup: 1,
                tbody: 1,
                td: 1,
                tfoot: 1,
                th: 1,
                thead: 1,
                tr: 1
            },
            html: w,
            head: v,
            style: p,
            script: p,
            body: r,
            base: {},
            link: {},
            meta: {},
            title: p,
            col: {},
            tr: {
                td: 1,
                th: 1
            },
            img: {},
            colgroup: {
                col: 1
            },
            noscript: r,
            td: r,
            br: {},
            wbr: {},
            th: r,
            center: r,
            kbd: n,
            button: a(k, g),
            basefont: {},
            h5: n,
            h4: n,
            samp: n,
            h6: n,
            ol: s,
            h1: n,
            h3: n,
            option: p,
            h2: n,
            form: a(b, f, g, k),
            select: {
                optgroup: 1,
                option: 1
            },
            font: n,
            ins: n,
            menu: s,
            abbr: n,
            label: n,
            table: {
                thead: 1,
                col: 1,
                tbody: 1,
                tr: 1,
                colgroup: 1,
                caption: 1,
                tfoot: 1
            },
            code: n,
            tfoot: o,
            cite: n,
            li: r,
            input: {},
            iframe: r,
            strong: n,
            textarea: p,
            noframes: r,
            big: n,
            small: n,
            span: n,
            hr: {},
            dt: n,
            sub: n,
            optgroup: {
                option: 1
            },
            param: {},
            bdo: n,
            "var": n,
            div: r,
            object: q,
            sup: n,
            dd: r,
            strike: n,
            area: {},
            dir: s,
            map: a({
                area: 1,
                form: 1,
                p: 1
            }, b, h, g),
            applet: q,
            dl: {
                dt: 1,
                dd: 1
            },
            del: n,
            isindex: {},
            fieldset: a({
                legend: 1
            }, m),
            thead: o,
            ul: s,
            acronym: n,
            b: n,
            a: l,
            blockquote: r,
            caption: n,
            i: n,
            u: n,
            tbody: o,
            s: n,
            address: a(f, k),
            tt: n,
            legend: n,
            q: n,
            pre: a(i, d),
            p: n,
            em: n,
            dfn: n,
            section: r,
            header: r,
            footer: r,
            nav: r,
            article: r,
            aside: r,
            figure: r,
            dialog: r,
            hgroup: r,
            mark: n,
            time: n,
            meter: n,
            menu: n,
            command: n,
            keygen: n,
            output: n,
            progress: q,
            audio: q,
            video: q,
            details: q,
            datagrid: q,
            datalist: q
        };
    }();
    var f = a.dtd;
    d.event = function (a) {
        this.$ = a;
    };
    d.event.prototype = {
        getKey: function () {
            return this.$.keyCode || this.$.which;
        },
        getKeystroke: function () {
            var a = this;
            var b = a.getKey();
            if (a.$.ctrlKey || a.$.metaKey) b += 1114112;
            if (a.$.shiftKey) b += 2228224;
            if (a.$.altKey) b += 4456448;
            return b;
        },
        preventDefault: function (a) {
            var b = this.$;
            if (b.preventDefault) b.preventDefault(); else b.returnValue = false;
            if (a) this.stopPropagation();
        },
        stopPropagation: function () {
            var a = this.$;
            if (a.stopPropagation) a.stopPropagation(); else a.cancelBubble = true;
        },
        getTarget: function () {
            var a = this.$.target || this.$.srcElement;
            return a ? new d.node(a) : null;
        },
        getPageOffset: function () {
            var a = this;
            var b = a.getTarget().getDocument().$, c = a.$.pageX || a.$.clientX + (b.documentElement.scrollLeft || b.body.scrollLeft), d = a.$.pageY || a.$.clientY + (b.documentElement.scrollTop || b.body.scrollTop);
            return {
                x: c,
                y: d
            };
        }
    };
    a.CTRL = 1114112;
    a.SHIFT = 2228224;
    a.ALT = 4456448;
    d.domObject = function (a) {
        if (a) this.$ = a;
    };
    d.domObject.prototype = function () {
        var b = function (b, c) {
            return function (e) {
                if ("undefined" != typeof a) b.fire(c, new d.event(e));
            };
        };
        return {
            getPrivate: function () {
                var a;
                if (!(a = this.getCustomData("_"))) this.setCustomData("_", a = {});
                return a;
            },
            on: function (c) {
                var d = this;
                var e = d.getCustomData("_cke_nativeListeners");
                if (!e) {
                    e = {};
                    d.setCustomData("_cke_nativeListeners", e);
                }
                if (!e[c]) {
                    var f = e[c] = b(d, c);
                    if (d.$.addEventListener) d.$.addEventListener(c, f, !!a.event.useCapture); else if (d.$.attachEvent) d.$.attachEvent("on" + c, f);
                }
                return a.event.prototype.on.apply(d, arguments);
            },
            removeListener: function (b) {
                var c = this;
                a.event.prototype.removeListener.apply(c, arguments);
                if (!c.hasListeners(b)) {
                    var d = c.getCustomData("_cke_nativeListeners"), e = d && d[b];
                    if (e) {
                        if (c.$.removeEventListener) c.$.removeEventListener(b, e, false); else if (c.$.detachEvent) c.$.detachEvent("on" + b, e);
                        delete d[b];
                    }
                }
            },
            removeAllListeners: function () {
                var a = this;
                var b = a.getCustomData("_cke_nativeListeners");
                for (var c in b) {
                    var d = b[c];
                    if (a.$.detachEvent) a.$.detachEvent("on" + c, d); else if (a.$.removeEventListener) a.$.removeEventListener(c, d, false);
                    delete b[c];
                }
            }
        };
    }();
    !function (b) {
        var c = {};
        a.on("reset", function () {
            c = {};
        });
        b.equals = function (a) {
            return a && a.$ === this.$;
        };
        b.setCustomData = function (a, b) {
            var d = this.getUniqueId(), e = c[d] || (c[d] = {});
            e[a] = b;
            return this;
        };
        b.getCustomData = function (a) {
            var b = this.$["data-cke-expando"], d = b && c[b];
            return d && d[a];
        };
        b.removeCustomData = function (a) {
            var b = this.$["data-cke-expando"], d = b && c[b], e = d && d[a];
            if ("undefined" != typeof e) delete d[a];
            return e || null;
        };
        b.clearCustomData = function () {
            this.removeAllListeners();
            var a = this.$["data-cke-expando"];
            a && delete c[a];
        };
        b.getUniqueId = function () {
            return this.$["data-cke-expando"] || (this.$["data-cke-expando"] = e.getNextNumber());
        };
        a.event.implementOn(b);
    }(d.domObject.prototype);
    d.window = function (a) {
        d.domObject.call(this, a);
    };
    d.window.prototype = new d.domObject();
    e.extend(d.window.prototype, {
        focus: function () {
            if (b.webkit && this.$.parent) this.$.parent.focus();
            this.$.focus();
        },
        getViewPaneSize: function () {
            var a = this.$.document, b = "CSS1Compat" == a.compatMode;
            return {
                width: (b ? a.documentElement.clientWidth : a.body.clientWidth) || 0,
                height: (b ? a.documentElement.clientHeight : a.body.clientHeight) || 0
            };
        },
        getScrollPosition: function () {
            var a = this.$;
            if ("pageXOffset" in a) return {
                x: a.pageXOffset || 0,
                y: a.pageYOffset || 0
            }; else {
                var b = a.document;
                return {
                    x: b.documentElement.scrollLeft || b.body.scrollLeft || 0,
                    y: b.documentElement.scrollTop || b.body.scrollTop || 0
                };
            }
        }
    });
    d.document = function (a) {
        d.domObject.call(this, a);
    };
    var g = d.document;
    g.prototype = new d.domObject();
    e.extend(g.prototype, {
        appendStyleSheet: function (a) {
            if (this.$.createStyleSheet) this.$.createStyleSheet(a); else {
                var b = new d.element("link");
                b.setAttributes({
                    rel: "stylesheet",
                    type: "text/css",
                    href: a
                });
                this.getHead().append(b);
            }
        },
        appendStyleText: function (a) {
            var b = this;
            if (b.$.createStyleSheet) {
                var c = b.$.createStyleSheet("");
                c.cssText = a;
            } else {
                var e = new d.element("style", b);
                e.append(new d.text(a, b));
                b.getHead().append(e);
            }
        },
        createElement: function (a, b) {
            var c = new d.element(a, this);
            if (b) {
                if (b.attributes) c.setAttributes(b.attributes);
                if (b.styles) c.setStyles(b.styles);
            }
            return c;
        },
        createText: function (a) {
            return new d.text(a, this);
        },
        focus: function () {
            this.getWindow().focus();
        },
        getById: function (a) {
            var b = this.$.getElementById(a);
            return b ? new d.element(b) : null;
        },
        getByAddress: function (a, b) {
            var c = this.$.documentElement;
            for (var e = 0; c && e < a.length; e++) {
                var f = a[e];
                if (!b) {
                    c = c.childNodes[f];
                    continue;
                }
                var g = -1;
                for (var h = 0; h < c.childNodes.length; h++) {
                    var i = c.childNodes[h];
                    if (true === b && 3 == i.nodeType && i.previousSibling && 3 == i.previousSibling.nodeType) continue;
                    g++;
                    if (g == f) {
                        c = i;
                        break;
                    }
                }
            }
            return c ? new d.node(c) : null;
        },
        getElementsByTag: function (a, b) {
            if (!(c && !(document.documentMode > 8)) && b) a = b + ":" + a;
            return new d.nodeList(this.$.getElementsByTagName(a));
        },
        getHead: function () {
            var a = this.$.getElementsByTagName("head")[0];
            if (!a) a = this.getDocumentElement().append(new d.element("head"), true); else a = new d.element(a);
            return (this.getHead = function () {
                return a;
            })();
        },
        getBody: function () {
            var a = new d.element(this.$.body);
            return (this.getBody = function () {
                return a;
            })();
        },
        getDocumentElement: function () {
            var a = new d.element(this.$.documentElement);
            return (this.getDocumentElement = function () {
                return a;
            })();
        },
        getWindow: function () {
            var a = new d.window(this.$.parentWindow || this.$.defaultView);
            return (this.getWindow = function () {
                return a;
            })();
        },
        write: function (a) {
            var c = this;
            c.$.open("text/html", "replace");
            b.isCustomDomain() && (c.$.domain = document.domain);
            c.$.write(a);
            c.$.close();
        }
    });
    d.node = function (a) {
        if (a) {
            var b = 9 == a.nodeType ? "document" : 1 == a.nodeType ? "element" : 3 == a.nodeType ? "text" : 8 == a.nodeType ? "comment" : "domObject";
            return new d[b](a);
        }
        return this;
    };
    d.node.prototype = new d.domObject();
    a.NODE_ELEMENT = 1;
    a.NODE_DOCUMENT = 9;
    a.NODE_TEXT = 3;
    a.NODE_COMMENT = 8;
    a.NODE_DOCUMENT_FRAGMENT = 11;
    a.POSITION_IDENTICAL = 0;
    a.POSITION_DISCONNECTED = 1;
    a.POSITION_FOLLOWING = 2;
    a.POSITION_PRECEDING = 4;
    a.POSITION_IS_CONTAINED = 8;
    a.POSITION_CONTAINS = 16;
    e.extend(d.node.prototype, {
        appendTo: function (a, b) {
            a.append(this, b);
            return a;
        },
        clone: function (a, b) {
            var c = this.$.cloneNode(a), e = function (c) {
                if (1 != c.nodeType) return;
                if (!b) c.removeAttribute("id", false);
                c["data-cke-expando"] = void 0;
                if (a) {
                    var d = c.childNodes;
                    for (var f = 0; f < d.length; f++) e(d[f]);
                }
            };
            e(c);
            return new d.node(c);
        },
        hasPrevious: function () {
            return !!this.$.previousSibling;
        },
        hasNext: function () {
            return !!this.$.nextSibling;
        },
        insertAfter: function (a) {
            a.$.parentNode.insertBefore(this.$, a.$.nextSibling);
            return a;
        },
        insertBefore: function (a) {
            a.$.parentNode.insertBefore(this.$, a.$);
            return a;
        },
        insertBeforeMe: function (a) {
            this.$.parentNode.insertBefore(a.$, this.$);
            return a;
        },
        getAddress: function (a) {
            var b = [], c = this.getDocument().$.documentElement, d = this.$;
            while (d && d != c) {
                var e = d.parentNode;
                if (e) b.unshift(this.getIndex.call({
                    $: d
                }, a));
                d = e;
            }
            return b;
        },
        getDocument: function () {
            return new g(this.$.ownerDocument || this.$.parentNode.ownerDocument);
        },
        getIndex: function (a) {
            var b = this.$, c = 0;
            while (b = b.previousSibling) {
                if (a && 3 == b.nodeType && (!b.nodeValue.length || b.previousSibling && 3 == b.previousSibling.nodeType)) continue;
                c++;
            }
            return c;
        },
        getNextSourceNode: function (a, b, c) {
            if (c && !c.call) {
                var d = c;
                c = function (a) {
                    return !a.equals(d);
                };
            }
            var e = !a && this.getFirst && this.getFirst(), f;
            if (!e) {
                if (1 == this.type && c && false === c(this, true)) return null;
                e = this.getNext();
            }
            while (!e && (f = (f || this).getParent())) {
                if (c && false === c(f, true)) return null;
                e = f.getNext();
            }
            if (!e) return null;
            if (c && false === c(e)) return null;
            if (b && b != e.type) return e.getNextSourceNode(false, b, c);
            return e;
        },
        getPreviousSourceNode: function (a, b, c) {
            if (c && !c.call) {
                var d = c;
                c = function (a) {
                    return !a.equals(d);
                };
            }
            var e = !a && this.getLast && this.getLast(), f;
            if (!e) {
                if (1 == this.type && c && false === c(this, true)) return null;
                e = this.getPrevious();
            }
            while (!e && (f = (f || this).getParent())) {
                if (c && false === c(f, true)) return null;
                e = f.getPrevious();
            }
            if (!e) return null;
            if (c && false === c(e)) return null;
            if (b && e.type != b) return e.getPreviousSourceNode(false, b, c);
            return e;
        },
        getPrevious: function (a) {
            var b = this.$, c;
            do {
                b = b.previousSibling;
                c = b && 10 != b.nodeType && new d.node(b);
            } while (c && a && !a(c));
            return c;
        },
        getNext: function (a) {
            var b = this.$, c;
            do {
                b = b.nextSibling;
                c = b && new d.node(b);
            } while (c && a && !a(c));
            return c;
        },
        getParent: function () {
            var a = this.$.parentNode;
            return a && 1 == a.nodeType ? new d.node(a) : null;
        },
        getParents: function (a) {
            var b = this, c = [];
            do c[a ? "push" : "unshift"](b); while (b = b.getParent());
            return c;
        },
        getCommonAncestor: function (a) {
            var b = this;
            if (a.equals(b)) return b;
            if (a.contains && a.contains(b)) return a;
            var c = b.contains ? b : b.getParent();
            do if (c.contains(a)) return c; while (c = c.getParent());
            return null;
        },
        getPosition: function (a) {
            var b = this.$, c = a.$;
            if (b.compareDocumentPosition) return b.compareDocumentPosition(c);
            if (b == c) return 0;
            if (1 == this.type && 1 == a.type) {
                if (b.contains) {
                    if (b.contains(c)) return 16 + 4;
                    if (c.contains(b)) return 8 + 2;
                }
                if ("sourceIndex" in b) return b.sourceIndex < 0 || c.sourceIndex < 0 ? 1 : b.sourceIndex < c.sourceIndex ? 4 : 2;
            }
            var d = this.getAddress(), e = a.getAddress(), f = Math.min(d.length, e.length);
            for (var g = 0; g <= f - 1; g++) if (d[g] != e[g]) {
                if (g < f) return d[g] < e[g] ? 4 : 2;
                break;
            }
            return d.length < e.length ? 16 + 4 : 8 + 2;
        },
        getAscendant: function (a, b) {
            var c = this.$, e;
            if (!b) c = c.parentNode;
            while (c) {
                if (c.nodeName && (e = c.nodeName.toLowerCase(), "string" == typeof a ? e == a : e in a)) return new d.node(c);
                c = c.parentNode;
            }
            return null;
        },
        hasAscendant: function (a, b) {
            var c = this.$;
            if (!b) c = c.parentNode;
            while (c) {
                if (c.nodeName && c.nodeName.toLowerCase() == a) return true;
                c = c.parentNode;
            }
            return false;
        },
        move: function (a, b) {
            a.append(this.remove(), b);
        },
        remove: function (a) {
            var b = this.$, c = b.parentNode;
            if (c) {
                if (a) for (var d; d = b.firstChild;) c.insertBefore(b.removeChild(d), b);
                c.removeChild(b);
            }
            return this;
        },
        replace: function (a) {
            this.insertBefore(a);
            a.remove();
        },
        trim: function () {
            this.ltrim();
            this.rtrim();
        },
        ltrim: function () {
            var a = this;
            var b;
            while (a.getFirst && (b = a.getFirst())) {
                if (3 == b.type) {
                    var c = e.ltrim(b.getText()), d = b.getLength();
                    if (!c) {
                        b.remove();
                        continue;
                    } else if (c.length < d) {
                        b.split(d - c.length);
                        a.$.removeChild(a.$.firstChild);
                    }
                }
                break;
            }
        },
        rtrim: function () {
            var a = this;
            var d;
            while (a.getLast && (d = a.getLast())) {
                if (3 == d.type) {
                    var f = e.rtrim(d.getText()), g = d.getLength();
                    if (!f) {
                        d.remove();
                        continue;
                    } else if (f.length < g) {
                        d.split(f.length);
                        a.$.lastChild.parentNode.removeChild(a.$.lastChild);
                    }
                }
                break;
            }
            if (!c && !b.opera) {
                d = a.$.lastChild;
                if (d && 1 == d.type && "br" == d.nodeName.toLowerCase()) d.parentNode.removeChild(d);
            }
        },
        isReadOnly: function () {
            var a = this;
            if (1 != this.type) a = this.getParent();
            if (a && "undefined" != typeof a.$.isContentEditable) return !(a.$.isContentEditable || a.data("cke-editable")); else {
                var b = a;
                while (b) {
                    if (b.is("body") || !!b.data("cke-editable")) break;
                    if ("false" == b.getAttribute("contentEditable")) return true; else if ("true" == b.getAttribute("contentEditable")) break;
                    b = b.getParent();
                }
                return false;
            }
        }
    });
    d.nodeList = function (a) {
        this.$ = a;
    };
    d.nodeList.prototype = {
        count: function () {
            return this.$.length;
        },
        getItem: function (a) {
            var b = this.$[a];
            return b ? new d.node(b) : null;
        }
    };
    d.element = function (a, b) {
        if ("string" == typeof a) a = (b ? b.$ : document).createElement(a);
        d.domObject.call(this, a);
    };
    var h = d.element;
    h.get = function (a) {
        return a && (a.$ ? a : new h(a));
    };
    h.prototype = new d.node();
    h.createFromHtml = function (a, b) {
        var c = new h("div", b);
        c.setHtml(a);
        return c.getFirst().remove();
    };
    h.setMarker = function (a, b, c, d) {
        var f = b.getCustomData("list_marker_id") || b.setCustomData("list_marker_id", e.getNextNumber()).getCustomData("list_marker_id"), g = b.getCustomData("list_marker_names") || b.setCustomData("list_marker_names", {}).getCustomData("list_marker_names");
        a[f] = b;
        g[c] = 1;
        return b.setCustomData(c, d);
    };
    h.clearAllMarkers = function (a) {
        for (var b in a) h.clearMarkers(a, a[b], 1);
    };
    h.clearMarkers = function (a, b, c) {
        var d = b.getCustomData("list_marker_names"), e = b.getCustomData("list_marker_id");
        for (var f in d) b.removeCustomData(f);
        b.removeCustomData("list_marker_names");
        if (c) {
            b.removeCustomData("list_marker_id");
            delete a[e];
        }
    };
    !function () {
        e.extend(h.prototype, {
            type: 1,
            addClass: function (a) {
                var b = this.$.className;
                if (b) {
                    var c = new RegExp("(?:^|\\s)" + a + "(?:\\s|$)", "");
                    if (!c.test(b)) b += " " + a;
                }
                this.$.className = b || a;
            },
            removeClass: function (a) {
                var b = this.getAttribute("class");
                if (b) {
                    var c = new RegExp("(?:^|\\s+)" + a + "(?=\\s|$)", "i");
                    if (c.test(b)) {
                        b = b.replace(c, "").replace(/^\s+/, "");
                        if (b) this.setAttribute("class", b); else this.removeAttribute("class");
                    }
                }
            },
            hasClass: function (a) {
                var b = new RegExp("(?:^|\\s+)" + a + "(?=\\s|$)", "");
                return b.test(this.getAttribute("class"));
            },
            append: function (a, b) {
                var c = this;
                if ("string" == typeof a) a = c.getDocument().createElement(a);
                if (b) c.$.insertBefore(a.$, c.$.firstChild); else c.$.appendChild(a.$);
                return a;
            },
            appendHtml: function (a) {
                var b = this;
                if (!b.$.childNodes.length) b.setHtml(a); else {
                    var c = new h("div", b.getDocument());
                    c.setHtml(a);
                    c.moveChildren(b);
                }
            },
            appendText: function (a) {
                if (void 0 != this.$.text) this.$.text += a; else this.append(new d.text(a));
            },
            appendBogus: function () {
                var a = this;
                var c = a.getLast();
                while (c && 3 == c.type && !e.rtrim(c.getText())) c = c.getPrevious();
                if (!c || !c.is || !c.is("br")) {
                    var d = b.opera ? a.getDocument().createText("") : a.getDocument().createElement("br");
                    b.gecko && d.setAttribute("type", "_moz");
                    a.append(d);
                }
            },
            breakParent: function (a) {
                var b = this;
                var c = new d.range(b.getDocument());
                c.setStartAfter(b);
                c.setEndAfter(a);
                var e = c.extractContents();
                c.insertNode(b.remove());
                e.insertAfterNode(b);
            },
            contains: c || b.webkit ? function (a) {
                var b = this.$;
                return 1 != a.type ? b.contains(a.getParent().$) : b != a.$ && b.contains(a.$);
            } : function (a) {
                return !!(16 & this.$.compareDocumentPosition(a.$));
            },
            focus: function () {
                function a() {
                    try {
                        this.$.focus();
                    } catch (a) { }
                }
                return function (b) {
                    if (b) e.setTimeout(a, 100, this); else a.call(this);
                };
            }(),
            getHtml: function () {
                var a = this.$.innerHTML;
                return c ? a.replace(/<\?[^>]*>/g, "") : a;
            },
            getOuterHtml: function () {
                var a = this;
                if (a.$.outerHTML) return a.$.outerHTML.replace(/<\?[^>]*>/, "");
                var b = a.$.ownerDocument.createElement("div");
                b.appendChild(a.$.cloneNode(true));
                return b.innerHTML;
            },
            setHtml: function (a) {
                return this.$.innerHTML = a;
            },
            setText: function (a) {
                h.prototype.setText = void 0 != this.$.innerText ? function (a) {
                    return this.$.innerText = a;
                } : function (a) {
                    return this.$.textContent = a;
                };
                return this.setText(a);
            },
            getAttribute: function () {
                var a = function (a) {
                    return this.$.getAttribute(a, 2);
                };
                if (c && (b.ie7Compat || b.ie6Compat)) return function (b) {
                    var c = this;
                    switch (b) {
                        case "class":
                            b = "className";
                            break;

                        case "http-equiv":
                            b = "httpEquiv";
                            break;

                        case "name":
                            return c.$.name;

                        case "tabindex":
                            var d = a.call(c, b);
                            if (0 !== d && 0 === c.$.tabIndex) d = null;
                            return d;
                            break;

                        case "checked":
                            var e = c.$.attributes.getNamedItem(b), f = e.specified ? e.nodeValue : c.$.checked;
                            return f ? "checked" : null;

                        case "hspace":
                        case "value":
                            return c.$[b];

                        case "style":
                            return c.$.style.cssText;

                        case "contenteditable":
                        case "contentEditable":
                            return c.$.attributes.getNamedItem("contentEditable").specified ? c.$.getAttribute("contentEditable") : null;
                    }
                    return a.call(c, b);
                }; else return a;
            }(),
            getChildren: function () {
                return new d.nodeList(this.$.childNodes);
            },
            getComputedStyle: c ? function (a) {
                return this.$.currentStyle[e.cssStyleToDomStyle(a)];
            } : function (a) {
                var b = this.getWindow().$.getComputedStyle(this.$, null);
                return b ? b.getPropertyValue(a) : "";
            },
            getDtd: function () {
                var a = f[this.getName()];
                this.getDtd = function () {
                    return a;
                };
                return a;
            },
            getElementsByTag: g.prototype.getElementsByTag,
            getTabIndex: c ? function () {
                var a = this.$.tabIndex;
                if (0 === a && !f.$tabIndex[this.getName()] && 0 !== parseInt(this.getAttribute("tabindex"), 10)) a = -1;
                return a;
            } : b.webkit ? function () {
                var a = this.$.tabIndex;
                if (void 0 == a) {
                    a = parseInt(this.getAttribute("tabindex"), 10);
                    if (isNaN(a)) a = -1;
                }
                return a;
            } : function () {
                return this.$.tabIndex;
            },
            getText: function () {
                return this.$.textContent || this.$.innerText || "";
            },
            getWindow: function () {
                return this.getDocument().getWindow();
            },
            getId: function () {
                return this.$.id || null;
            },
            getNameAtt: function () {
                return this.$.name || null;
            },
            getName: function () {
                var a = this.$.nodeName.toLowerCase();
                if (c && !(document.documentMode > 8)) {
                    var b = this.$.scopeName;
                    if ("HTML" != b) a = b.toLowerCase() + ":" + a;
                }
                return (this.getName = function () {
                    return a;
                })();
            },
            getValue: function () {
                return this.$.value;
            },
            getFirst: function (a) {
                var b = this.$.firstChild, c = b && new d.node(b);
                if (c && a && !a(c)) c = c.getNext(a);
                return c;
            },
            getLast: function (a) {
                var b = this.$.lastChild, c = b && new d.node(b);
                if (c && a && !a(c)) c = c.getPrevious(a);
                return c;
            },
            getStyle: function (a) {
                return this.$.style[e.cssStyleToDomStyle(a)];
            },
            is: function () {
                var a = this.getName();
                for (var b = 0; b < arguments.length; b++) if (arguments[b] == a) return true;
                return false;
            },
            isEditable: function (a) {
                var b = this;
                var c = b.getName();
                if (b.isReadOnly() || "none" == b.getComputedStyle("display") || "hidden" == b.getComputedStyle("visibility") || b.is("a") && b.data("cke-saved-name") && !b.getChildCount() || f.$nonEditable[c] || f.$empty[c]) return false;
                if (false !== a) {
                    var d = f[c] || f.span;
                    return d && d["#"];
                }
                return true;
            },
            isIdentical: function (a) {
                if (this.getName() != a.getName()) return false;
                var b = this.$.attributes, d = a.$.attributes, e = b.length, f = d.length;
                for (var g = 0; g < e; g++) {
                    var h = b[g];
                    if ("_moz_dirty" == h.nodeName) continue;
                    if ((!c || h.specified && "data-cke-expando" != h.nodeName) && h.nodeValue != a.getAttribute(h.nodeName)) return false;
                }
                if (c) for (g = 0; g < f; g++) {
                    h = d[g];
                    if (h.specified && "data-cke-expando" != h.nodeName && h.nodeValue != this.getAttribute(h.nodeName)) return false;
                }
                return true;
            },
            isVisible: function () {
                var c = this;
                var d = (c.$.offsetHeight || c.$.offsetWidth) && "hidden" != c.getComputedStyle("visibility"), e, f;
                if (d && (b.webkit || b.opera)) {
                    e = c.getWindow();
                    if (!e.equals(a.document.getWindow()) && (f = e.$.frameElement)) d = new h(f).isVisible();
                }
                return !!d;
            },
            isEmptyInlineRemoveable: function () {
                if (!f.$removeEmpty[this.getName()]) return false;
                var a = this.getChildren();
                for (var b = 0, c = a.count(); b < c; b++) {
                    var d = a.getItem(b);
                    if (1 == d.type && d.data("cke-bookmark")) continue;
                    if (1 == d.type && !d.isEmptyInlineRemoveable() || 3 == d.type && e.trim(d.getText())) return false;
                }
                return true;
            },
            hasAttributes: c && (b.ie7Compat || b.ie6Compat) ? function () {
                var a = this.$.attributes;
                for (var b = 0; b < a.length; b++) {
                    var c = a[b];
                    switch (c.nodeName) {
                        case "class":
                            if (this.getAttribute("class")) return true;

                        case "data-cke-expando":
                            continue;

                        default:
                            if (c.specified) return true;
                    }
                }
                return false;
            } : function () {
                var a = this.$.attributes, b = a.length, c = {
                    "data-cke-expando": 1,
                    _moz_dirty: 1
                };
                return b > 0 && (b > 2 || !c[a[0].nodeName] || 2 == b && !c[a[1].nodeName]);
            },
            hasAttribute: function () {
                function a(a) {
                    var b = this.$.attributes.getNamedItem(a);
                    return !!(b && b.specified);
                }
                return c && b.version < 8 ? function (b) {
                    if ("name" == b) return !!this.$.name;
                    return a.call(this, b);
                } : a;
            }(),
            hide: function () {
                this.setStyle("display", "none");
            },
            moveChildren: function (a, b) {
                var c = this.$;
                a = a.$;
                if (c == a) return;
                var d;
                if (b) while (d = c.lastChild) a.insertBefore(c.removeChild(d), a.firstChild); else while (d = c.firstChild) a.appendChild(c.removeChild(d));
            },
            mergeSiblings: function () {
                function a(a, b, c) {
                    if (b && 1 == b.type) {
                        var d = [];
                        while (b.data("cke-bookmark") || b.isEmptyInlineRemoveable()) {
                            d.push(b);
                            b = c ? b.getNext() : b.getPrevious();
                            if (!b || 1 != b.type) return;
                        }
                        if (a.isIdentical(b)) {
                            var e = c ? a.getLast() : a.getFirst();
                            while (d.length) d.shift().move(a, !c);
                            b.moveChildren(a, !c);
                            b.remove();
                            if (e && 1 == e.type) e.mergeSiblings();
                        }
                    }
                }
                return function (b) {
                    var c = this;
                    if (!(false === b || f.$removeEmpty[c.getName()] || c.is("a"))) return;
                    a(c, c.getNext(), true);
                    a(c, c.getPrevious());
                };
            }(),
            show: function () {
                this.setStyles({
                    display: "",
                    visibility: ""
                });
            },
            setAttribute: function () {
                var a = function (a, b) {
                    this.$.setAttribute(a, b);
                    return this;
                };
                if (c && (b.ie7Compat || b.ie6Compat)) return function (b, c) {
                    var d = this;
                    if ("class" == b) d.$.className = c; else if ("style" == b) d.$.style.cssText = c; else if ("tabindex" == b) d.$.tabIndex = c; else if ("checked" == b) d.$.checked = c; else if ("contenteditable" == b) a.call(d, "contentEditable", c); else a.apply(d, arguments);
                    return d;
                }; else if (b.ie8Compat && b.secure) return function (b, c) {
                    if ("src" == b && c.match(/^http:\/\//)) try {
                        a.apply(this, arguments);
                    } catch (d) { } else a.apply(this, arguments);
                    return this;
                }; else return a;
            }(),
            setAttributes: function (a) {
                for (var b in a) this.setAttribute(b, a[b]);
                return this;
            },
            setValue: function (a) {
                this.$.value = a;
                return this;
            },
            removeAttribute: function () {
                var a = function (a) {
                    this.$.removeAttribute(a);
                };
                if (c && (b.ie7Compat || b.ie6Compat)) return function (b) {
                    if ("class" == b) b = "className"; else if ("tabindex" == b) b = "tabIndex"; else if ("contenteditable" == b) b = "contentEditable";
                    a.call(this, b);
                }; else return a;
            }(),
            removeAttributes: function (a) {
                if (e.isArray(a)) for (var b = 0; b < a.length; b++) this.removeAttribute(a[b]); else for (var c in a) a.hasOwnProperty(c) && this.removeAttribute(c);
            },
            removeStyle: function (a) {
                var b = this;
                var c = b.$.style;
                if (!c.removeProperty && ("border" == a || "margin" == a || "padding" == a)) {
                    var d = j(a);
                    for (var f = 0; f < d.length; f++) b.removeStyle(d[f]);
                    return;
                }
                c.removeProperty ? c.removeProperty(a) : c.removeAttribute(e.cssStyleToDomStyle(a));
                if (!b.$.style.cssText) b.removeAttribute("style");
            },
            setStyle: function (a, b) {
                this.$.style[e.cssStyleToDomStyle(a)] = b;
                return this;
            },
            setStyles: function (a) {
                for (var b in a) this.setStyle(b, a[b]);
                return this;
            },
            setOpacity: function (a) {
                if (c && b.version < 9) {
                    a = Math.round(100 * a);
                    this.setStyle("filter", a >= 100 ? "" : "progid:DXImageTransform.Microsoft.Alpha(opacity=" + a + ")");
                } else this.setStyle("opacity", a);
            },
            unselectable: b.gecko ? function () {
                this.$.style.MozUserSelect = "none";
                this.on("dragstart", function (a) {
                    a.data.preventDefault();
                });
            } : b.webkit ? function () {
                this.$.style.KhtmlUserSelect = "none";
                this.on("dragstart", function (a) {
                    a.data.preventDefault();
                });
            } : function () {
                if (c || b.opera) {
                    var a = this.$, d = a.getElementsByTagName("*"), e, f = 0;
                    a.unselectable = "on";
                    while (e = d[f++]) switch (e.tagName.toLowerCase()) {
                        case "iframe":
                        case "textarea":
                        case "input":
                        case "select":
                            break;

                        default:
                            e.unselectable = "on";
                    }
                }
            },
            getPositionedAncestor: function () {
                var a = this;
                while ("html" != a.getName()) {
                    if ("static" != a.getComputedStyle("position")) return a;
                    a = a.getParent();
                }
                return null;
            },
            getDocumentPosition: function (a) {
                var d = this;
                var e = 0, f = 0, g = d.getDocument(), i = g.getBody(), j = "BackCompat" == g.$.compatMode;
                if (document.documentElement.getBoundingClientRect) {
                    var k = d.$.getBoundingClientRect(), l = g.$, m = l.documentElement, n = m.clientTop || i.$.clientTop || 0, o = m.clientLeft || i.$.clientLeft || 0, p = true;
                    if (c) {
                        var q = g.getDocumentElement().contains(d), r = g.getBody().contains(d);
                        p = j && r || !j && q;
                    }
                    if (p) {
                        e = k.left + (!j && m.scrollLeft || i.$.scrollLeft);
                        e -= o;
                        f = k.top + (!j && m.scrollTop || i.$.scrollTop);
                        f -= n;
                    }
                } else {
                    var s = d, t = null, u;
                    while (s && !("body" == s.getName() || "html" == s.getName())) {
                        e += s.$.offsetLeft - s.$.scrollLeft;
                        f += s.$.offsetTop - s.$.scrollTop;
                        if (!s.equals(d)) {
                            e += s.$.clientLeft || 0;
                            f += s.$.clientTop || 0;
                        }
                        var v = t;
                        while (v && !v.equals(s)) {
                            e -= v.$.scrollLeft;
                            f -= v.$.scrollTop;
                            v = v.getParent();
                        }
                        t = s;
                        s = (u = s.$.offsetParent) ? new h(u) : null;
                    }
                }
                if (a) {
                    var w = d.getWindow(), x = a.getWindow();
                    if (!w.equals(x) && w.$.frameElement) {
                        var y = new h(w.$.frameElement).getDocumentPosition(a);
                        e += y.x;
                        f += y.y;
                    }
                }
                if (!document.documentElement.getBoundingClientRect) if (b.gecko && !j) {
                    e += d.$.clientLeft ? 1 : 0;
                    f += d.$.clientTop ? 1 : 0;
                }
                return {
                    x: e,
                    y: f
                };
            },
            scrollIntoView: function (a) {
                var b = this.getParent();
                if (!b) return;
                do {
                    var c = b.$.clientWidth && b.$.clientWidth < b.$.scrollWidth || b.$.clientHeight && b.$.clientHeight < b.$.scrollHeight;
                    if (c) this.scrollIntoParent(b, a, 1);
                    if (b.is("html")) {
                        var d = b.getWindow();
                        try {
                            var e = d.$.frameElement;
                            e && (b = new h(e));
                        } catch (f) { }
                    }
                } while (b = b.getParent());
            },
            scrollIntoParent: function (a, b, c) {
                !a && (a = this.getWindow());
                var e = a.getDocument(), f = "BackCompat" == e.$.compatMode;
                if (a instanceof d.window) a = f ? e.getBody() : e.getDocumentElement();
                function g(b, c) {
                    if (/body|html/.test(a.getName())) a.getWindow().$.scrollBy(b, c); else {
                        a.$.scrollLeft += b;
                        a.$.scrollTop += c;
                    }
                }
                function i(a, b) {
                    var c = {
                        x: 0,
                        y: 0
                    };
                    if (!a.is(f ? "body" : "html")) {
                        var d = a.$.getBoundingClientRect();
                        c.x = d.left, c.y = d.top;
                    }
                    var e = a.getWindow();
                    if (!e.equals(b)) {
                        var g = i(h.get(e.$.frameElement), b);
                        c.x += g.x, c.y += g.y;
                    }
                    return c;
                }
                function j(a, b) {
                    return parseInt(a.getComputedStyle("margin-" + b) || 0, 10) || 0;
                }
                var k = a.getWindow(), l = i(this, k), m = i(a, k), n = this.$.offsetHeight, o = this.$.offsetWidth, p = a.$.clientHeight, q = a.$.clientWidth, r, s;
                r = {
                    x: l.x - j(this, "left") - m.x || 0,
                    y: l.y - j(this, "top") - m.y || 0
                };
                s = {
                    x: l.x + o + j(this, "right") - (m.x + q) || 0,
                    y: l.y + n + j(this, "bottom") - (m.y + p) || 0
                };
                if (r.y < 0 || s.y > 0) g(0, true === b ? r.y : false === b ? s.y : r.y < 0 ? r.y : s.y);
                if (c && (r.x < 0 || s.x > 0)) g(r.x < 0 ? r.x : s.x, 0);
            },
            setState: function (a) {
                var b = this;
                switch (a) {
                    case 1:
                        b.addClass("cke_on");
                        b.removeClass("cke_off");
                        b.removeClass("cke_disabled");
                        break;

                    case 0:
                        b.addClass("cke_disabled");
                        b.removeClass("cke_off");
                        b.removeClass("cke_on");
                        break;

                    default:
                        b.addClass("cke_off");
                        b.removeClass("cke_on");
                        b.removeClass("cke_disabled");
                }
            },
            getFrameDocument: function () {
                var a = this.$;
                try {
                    a.contentWindow.document;
                } catch (d) {
                    a.src = a.src;
                    if (c && b.version < 7) window.showModalDialog('javascript:document.write("<script>window.setTimeout(function(){window.close();},50);</script>")');
                }
                return a && new g(a.contentWindow.document);
            },
            copyAttributes: function (a, b) {
                var d = this;
                var e = d.$.attributes;
                b = b || {};
                for (var f = 0; f < e.length; f++) {
                    var g = e[f], h = g.nodeName.toLowerCase(), i;
                    if (h in b) continue;
                    if ("checked" == h && (i = d.getAttribute(h))) a.setAttribute(h, i); else if (g.specified || c && g.nodeValue && "value" == h) {
                        i = d.getAttribute(h);
                        if (null === i) i = g.nodeValue;
                        a.setAttribute(h, i);
                    }
                }
                if ("" !== d.$.style.cssText) a.$.style.cssText = d.$.style.cssText;
            },
            renameNode: function (a) {
                var b = this;
                if (b.getName() == a) return;
                var c = b.getDocument(), d = new h(a, c);
                b.copyAttributes(d);
                b.moveChildren(d);
                b.getParent() && b.$.parentNode.replaceChild(d.$, b.$);
                d.$["data-cke-expando"] = b.$["data-cke-expando"];
                b.$ = d.$;
            },
            getChild: function (a) {
                var b = this.$;
                if (!a.slice) b = b.childNodes[a]; else while (a.length > 0 && b) b = b.childNodes[a.shift()];
                return b ? new d.node(b) : null;
            },
            getChildCount: function () {
                return this.$.childNodes.length;
            },
            disableContextMenu: function () {
                this.on("contextmenu", function (a) {
                    if (!a.data.getTarget().hasClass("cke_enable_context_menu")) a.data.preventDefault();
                });
            },
            getDirection: function (a) {
                var b = this;
                return a ? b.getComputedStyle("direction") || b.getDirection() || b.getDocument().$.dir || b.getDocument().getBody().getDirection(1) : b.getStyle("direction") || b.getAttribute("dir");
            },
            data: function (a, b) {
                a = "data-" + a;
                if (void 0 === b) return this.getAttribute(a); else if (false === b) this.removeAttribute(a); else this.setAttribute(a, b);
                return null;
            }
        });
        var i = {
            width: ["border-left-width", "border-right-width", "padding-left", "padding-right"],
            height: ["border-top-width", "border-bottom-width", "padding-top", "padding-bottom"]
        };
        function j(a) {
            var b = ["top", "left", "right", "bottom"], c;
            if ("border" == a) c = ["color", "style", "width"];
            var d = [];
            for (var e = 0; e < b.length; e++) if (c) for (var f = 0; f < c.length; f++) d.push([a, b[e], c[f]].join("-")); else d.push([a, b[e]].join("-"));
            return d;
        }
        function k(a) {
            var b = 0;
            for (var c = 0, d = i[a].length; c < d; c++) b += parseInt(this.getComputedStyle(i[a][c]) || 0, 10) || 0;
            return b;
        }
        h.prototype.setSize = function (a, d, e) {
            if ("number" == typeof d) {
                if (e && !(c && b.quirks)) d -= k.call(this, a);
                this.setStyle(a, d + "px");
            }
        };
        h.prototype.getSize = function (a, b) {
            var c = Math.max(this.$["offset" + e.capitalize(a)], this.$["client" + e.capitalize(a)]) || 0;
            if (b) c -= k.call(this, a);
            return c;
        };
    }();
    a.command = function (b, c) {
        this.uiItems = [];
        this.exec = function (a) {
            var d = this;
            if (0 == d.state) return false;
            if (d.editorFocus) b.focus();
            if (true === d.fire("exec")) return true;
            return false !== c.exec.call(d, b, a);
        };
        this.refresh = function () {
            if (true === this.fire("refresh")) return true;
            return c.refresh && false !== c.refresh.apply(this, arguments);
        };
        e.extend(this, c, {
            modes: {
                wysiwyg: 1
            },
            editorFocus: 1,
            state: 2
        });
        a.event.call(this);
    };
    a.command.prototype = {
        enable: function () {
            var a = this;
            if (0 == a.state) a.setState(!a.preserveState || "undefined" == typeof a.previousState ? 2 : a.previousState);
        },
        disable: function () {
            this.setState(0);
        },
        setState: function (a) {
            var b = this;
            if (b.state == a) return false;
            b.previousState = b.state;
            b.state = a;
            b.fire("state");
            return true;
        },
        toggleState: function () {
            var a = this;
            if (2 == a.state) a.setState(1); else if (1 == a.state) a.setState(2);
        }
    };
    a.event.implementOn(a.command.prototype, true);
    a.ENTER_P = 1;
    a.ENTER_BR = 2;
    a.ENTER_DIV = 3;
    a.config = {
        customConfig: "config.js",
        autoUpdateElement: true,
        baseHref: "",
        contentsCss: a.basePath + "contents.css",
        contentsLangDirection: "ui",
        contentsLanguage: "",
        language: "",
        defaultLanguage: "en",
        enterMode: 1,
        forceEnterMode: false,
        shiftEnterMode: 2,
        corePlugins: "",
        docType: '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">',
        bodyId: "",
        bodyClass: "",
        fullPage: false,
        height: 200,
        plugins: "about,a11yhelp,basicstyles,bidi,blockquote,button,clipboard,colorbutton,colordialog,contextmenu,dialogadvtab,div,elementspath,enterkey,entities,filebrowser,find,flash,font,format,forms,horizontalrule,htmldataprocessor,iframe,image,indent,justify,keystrokes,link,list,liststyle,maximize,newpage,pagebreak,pastefromword,pastetext,popup,preview,print,removeformat,resize,save,scayt,showblocks,showborders,smiley,sourcearea,specialchar,stylescombo,tab,table,tabletools,templates,toolbar,undo,wsc,wysiwygarea",
        extraPlugins: "",
        removePlugins: "",
        protectedSource: [],
        tabIndex: 0,
        theme: "default",
        skin: "kama",
        width: "",
        baseFloatZIndex: 1e4
    };
    var i = a.config;
    a.focusManager = function (a) {
        if (a.focusManager) return a.focusManager;
        this.hasFocus = false;
        this._ = {
            editor: a
        };
        return this;
    };
    a.focusManager.prototype = {
        focus: function () {
            var b = this;
            if (b._.timer) clearTimeout(b._.timer);
            if (!b.hasFocus) {
                if (a.currentInstance) a.currentInstance.focusManager.forceBlur();
                var c = b._.editor;
                c.container.getChild(1).addClass("cke_focus");
                b.hasFocus = true;
                c.fire("focus");
            }
        },
        blur: function () {
            var a = this;
            if (a._.timer) clearTimeout(a._.timer);
            a._.timer = setTimeout(function () {
                delete a._.timer;
                a.forceBlur();
            }, 100);
        },
        forceBlur: function () {
            if (this.hasFocus) {
                var a = this._.editor;
                a.container.getChild(1).removeClass("cke_focus");
                this.hasFocus = false;
                a.fire("blur");
            }
        }
    };
    !function () {
        var b = {};
        a.lang = {
            languages: {
                af: 1,
                ar: 1,
                bg: 1,
                bn: 1,
                bs: 1,
                ca: 1,
                cs: 1,
                cy: 1,
                da: 1,
                de: 1,
                el: 1,
                "en-au": 1,
                "en-ca": 1,
                "en-gb": 1,
                en: 1,
                eo: 1,
                es: 1,
                et: 1,
                eu: 1,
                fa: 1,
                fi: 1,
                fo: 1,
                "fr-ca": 1,
                fr: 1,
                gl: 1,
                gu: 1,
                he: 1,
                hi: 1,
                hr: 1,
                hu: 1,
                is: 1,
                it: 1,
                ja: 1,
                ka: 1,
                km: 1,
                ko: 1,
                ku: 1,
                lt: 1,
                lv: 1,
                mn: 1,
                ms: 1,
                nb: 1,
                nl: 1,
                no: 1,
                pl: 1,
                "pt-br": 1,
                pt: 1,
                ro: 1,
                ru: 1,
                sk: 1,
                sl: 1,
                "sr-latn": 1,
                sr: 1,
                sv: 1,
                th: 1,
                tr: 1,
                ug: 1,
                uk: 1,
                vi: 1,
                "zh-cn": 1,
                zh: 1
            },
            load: function (b, c, d) {
                if (!b || !a.lang.languages[b]) b = this.detect(c, b);
                if (!this[b]) a.scriptLoader.load(a.getUrl("lang/" + b + ".js"), function () {
                    d(b, this[b]);
                }, this); else d(b, this[b]);
            },
            detect: function (b, c) {
                var d = this.languages;
                c = c || navigator.userLanguage || navigator.language || b;
                var e = c.toLowerCase().match(/([a-z]+)(?:-([a-z]+))?/), f = e[1], g = e[2];
                if (d[f + "-" + g]) f = f + "-" + g; else if (!d[f]) f = null;
                a.lang.detect = f ? function () {
                    return f;
                } : function (a) {
                    return a;
                };
                return f || b;
            }
        };
    }();
    a.scriptLoader = function () {
        var b = {}, d = {};
        return {
            load: function (e, f, g, i) {
                var j = "string" == typeof e;
                if (j) e = [e];
                if (!g) g = a;
                var k = e.length, l = [], m = [], n = function (a) {
                    if (f) if (j) f.call(g, a); else f.call(g, l, m);
                };
                if (0 === k) {
                    n(true);
                    return;
                }
                var o = function (b, c) {
                    (c ? l : m).push(b);
                    if (--k <= 0) {
                        i && a.document.getDocumentElement().removeStyle("cursor");
                        n(c);
                    }
                }, p = function (a, c) {
                    b[a] = 1;
                    var e = d[a];
                    delete d[a];
                    for (var f = 0; f < e.length; f++) e[f](a, c);
                }, q = function (e) {
                    if (b[e]) {
                        o(e, true);
                        return;
                    }
                    var g = d[e] || (d[e] = []);
                    g.push(o);
                    if (g.length > 1) return;
                    var i = new h("script");
                    i.setAttributes({
                        type: "text/javascript",
                        src: e
                    });
                    if (f) if (c) i.$.onreadystatechange = function () {
                        if ("loaded" == i.$.readyState || "complete" == i.$.readyState) {
                            i.$.onreadystatechange = null;
                            p(e, true);
                        }
                    }; else {
                        i.$.onload = function () {
                            setTimeout(function () {
                                p(e, true);
                            }, 0);
                        };
                        i.$.onerror = function () {
                            p(e, false);
                        };
                    }
                    i.appendTo(a.document.getHead());
                };
                i && a.document.getDocumentElement().setStyle("cursor", "wait");
                for (var r = 0; r < k; r++) q(e[r]);
            }
        };
    }();
    a.resourceManager = function (a, b) {
        var c = this;
        c.basePath = a;
        c.fileName = b;
        c.registered = {};
        c.loaded = {};
        c.externals = {};
        c._ = {
            waitingList: {}
        };
    };
    a.resourceManager.prototype = {
        add: function (b, c) {
            if (this.registered[b]) throw '[CKEDITOR.resourceManager.add] The resource name "' + b + '" is already registered.';
            a.fire(b + e.capitalize(this.fileName) + "Ready", this.registered[b] = c || {});
        },
        get: function (a) {
            return this.registered[a] || null;
        },
        getPath: function (b) {
            var c = this.externals[b];
            return a.getUrl(c && c.dir || this.basePath + b + "/");
        },
        getFilePath: function (b) {
            var c = this.externals[b];
            return a.getUrl(this.getPath(b) + (c && "string" == typeof c.file ? c.file : this.fileName + ".js"));
        },
        addExternal: function (a, b, c) {
            a = a.split(",");
            for (var d = 0; d < a.length; d++) {
                var e = a[d];
                this.externals[e] = {
                    dir: b,
                    file: c
                };
            }
        },
        load: function (b, c, d) {
            if (!e.isArray(b)) b = b ? [b] : [];
            var f = this.loaded, g = this.registered, h = [], i = {}, j = {};
            for (var k = 0; k < b.length; k++) {
                var l = b[k];
                if (!l) continue;
                if (!f[l] && !g[l]) {
                    var m = this.getFilePath(l);
                    h.push(m);
                    if (!(m in i)) i[m] = [];
                    i[m].push(l);
                } else j[l] = this.get(l);
            }
            a.scriptLoader.load(h, function (a, b) {
                if (b.length) throw '[CKEDITOR.resourceManager.load] Resource name "' + i[b[0]].join(",") + '" was not found at "' + b[0] + '".';
                for (var e = 0; e < a.length; e++) {
                    var g = i[a[e]];
                    for (var h = 0; h < g.length; h++) {
                        var k = g[h];
                        j[k] = this.get(k);
                        f[k] = 1;
                    }
                }
                c.call(d, j);
            }, this);
        }
    };
    a.plugins = new a.resourceManager("plugins/", "plugin");
    var j = a.plugins;
    j.load = e.override(j.load, function (a) {
        return function (b, c, d) {
            var f = {}, g = function (b) {
                a.call(this, b, function (a) {
                    e.extend(f, a);
                    var b = [];
                    for (var h in a) {
                        var i = a[h], j = i && i.requires;
                        if (j) for (var k = 0; k < j.length; k++) if (!f[j[k]]) b.push(j[k]);
                    }
                    if (b.length) g.call(this, b); else {
                        for (h in f) {
                            i = f[h];
                            if (i.onLoad && !i.onLoad._called) {
                                i.onLoad();
                                i.onLoad._called = 1;
                            }
                        }
                        if (c) c.call(d || window, f);
                    }
                }, this);
            };
            g.call(this, b);
        };
    });
    j.setLang = function (a, b, c) {
        var d = this.get(a), f = d.langEntries || (d.langEntries = {}), g = d.lang || (d.lang = []);
        if (e.indexOf(g, b) == -1) g.push(b);
        f[b] = c;
    };
    a.skins = function () {
        var b = {}, c = {}, d = function (d, f, g, h) {
            var i = b[f];
            if (!d.skin) {
                d.skin = i;
                if (i.init) i.init(d);
            }
            var j = function (b) {
                for (var d = 0; d < b.length; d++) b[d] = a.getUrl(c[f] + b[d]);
            };
            function k(a, b) {
                return a.replace(/url\s*\(([\s'"]*)(.*?)([\s"']*)\)/g, function (a, c, d, e) {
                    if (/^\/|^\w?:/.test(d)) return a; else return "url(" + b + c + d + e + ")";
                });
            }
            g = i[g];
            var l = !g || !!g._isLoaded;
            if (l) h && h(); else {
                var m = g._pending || (g._pending = []);
                m.push(h);
                if (m.length > 1) return;
                var n = !g.css || !g.css.length, o = !g.js || !g.js.length, p = function () {
                    if (n && o) {
                        g._isLoaded = 1;
                        for (var a = 0; a < m.length; a++) if (m[a]) m[a]();
                    }
                };
                if (!n) {
                    var q = g.css;
                    if (e.isArray(q)) {
                        j(q);
                        for (var r = 0; r < q.length; r++) a.document.appendStyleSheet(q[r]);
                    } else {
                        q = k(q, a.getUrl(c[f]));
                        a.document.appendStyleText(q);
                    }
                    g.css = q;
                    n = 1;
                }
                if (!o) {
                    j(g.js);
                    a.scriptLoader.load(g.js, function () {
                        o = 1;
                        p();
                    });
                }
                p();
            }
        };
        return {
            add: function (d, e) {
                b[d] = e;
                e.skinPath = c[d] || (c[d] = a.getUrl("skins/" + d + "/"));
            },
            load: function (e, f, g) {
                var h = e.skinName, i = e.skinPath;
                if (b[h]) d(e, h, f, g); else {
                    c[h] = i;
                    a.scriptLoader.load(a.getUrl(i + "skin.js"), function () {
                        d(e, h, f, g);
                    });
                }
            }
        };
    }();
    a.themes = new a.resourceManager("themes/", "theme");
    a.ui = function (a) {
        if (a.ui) return a.ui;
        this._ = {
            handlers: {},
            items: {},
            editor: a
        };
        return this;
    };
    var k = a.ui;
    k.prototype = {
        add: function (a, b, c) {
            this._.items[a] = {
                type: b,
                command: c.command || null,
                args: Array.prototype.slice.call(arguments, 2)
            };
        },
        create: function (a) {
            var b = this;
            var c = b._.items[a], d = c && b._.handlers[c.type], f = c && c.command && b._.editor.getCommand(c.command), g = d && d.create.apply(b, c.args);
            c && (g = e.extend(g, b._.editor.skin[c.type], true));
            if (f) f.uiItems.push(g);
            return g;
        },
        addHandler: function (a, b) {
            this._.handlers[a] = b;
        }
    };
    a.event.implementOn(k);
    !function () {
        var c = 0, d = function () {
            var b = "editor" + ++c;
            return a.instances && a.instances[b] ? d() : b;
        }, f = {}, g = function (b) {
            var c = b.config.customConfig;
            if (!c) return false;
            c = a.getUrl(c);
            var d = f[c] || (f[c] = {});
            if (d.fn) {
                d.fn.call(b, b.config);
                if (a.getUrl(b.config.customConfig) == c || !g(b)) b.fireOnce("customConfigLoaded");
            } else a.scriptLoader.load(c, function () {
                if (a.editorConfig) d.fn = a.editorConfig; else d.fn = function () { };
                g(b);
            });
            return true;
        }, l = function (a, b) {
            a.on("customConfigLoaded", function () {
                if (b) {
                    if (b.on) for (var c in b.on) a.on(c, b.on[c]);
                    e.extend(a.config, b, true);
                    delete a.config.on;
                }
                m(a);
            });
            if (b && void 0 != b.customConfig) a.config.customConfig = b.customConfig;
            if (!g(a)) a.fireOnce("customConfigLoaded");
        }, m = function (b) {
            var c = b.config.skin.split(","), d = c[0], e = a.getUrl(c[1] || "skins/" + d + "/");
            b.skinName = d;
            b.skinPath = e;
            b.skinClass = "cke_skin_" + d;
            b.tabIndex = b.config.tabIndex || b.element.getAttribute("tabindex") || 0;
            b.readOnly = !!(b.config.readOnly || b.element.getAttribute("disabled"));
            b.fireOnce("configLoaded");
            p(b);
        }, n = function (c) {
            a.lang.load(c.config.language, c.config.defaultLanguage, function (a, d) {
                c.langCode = a;
                c.lang = e.prototypedCopy(d);
                if (b.gecko && b.version < 10900 && "rtl" == c.lang.dir) c.lang.dir = "ltr";
                c.fire("langLoaded");
                var f = c.config;
                "ui" == f.contentsLangDirection && (f.contentsLangDirection = c.lang.dir);
                o(c);
            });
        }, o = function (c) {
            var d = c.config, f = d.plugins, g = d.extraPlugins, h = d.removePlugins;
            if (g) {
                var i = new RegExp("(?:^|,)(?:" + g.replace(/\s*,\s*/g, "|") + ")(?=,|$)", "g");
                f = f.replace(i, "");
                f += "," + g;
            }
            if (h) {
                i = new RegExp("(?:^|,)(?:" + h.replace(/\s*,\s*/g, "|") + ")(?=,|$)", "g");
                f = f.replace(i, "");
            }
            b.air && (f += ",adobeair");
            j.load(f.split(","), function (b) {
                var d = [], f = [], g = [];
                c.plugins = b;
                for (var h in b) {
                    var i = b[h], k = i.lang, l = j.getPath(h), m = null;
                    i.path = l;
                    if (k) {
                        m = e.indexOf(k, c.langCode) >= 0 ? c.langCode : k[0];
                        if (!i.langEntries || !i.langEntries[m]) g.push(a.getUrl(l + "lang/" + m + ".js")); else {
                            e.extend(c.lang, i.langEntries[m]);
                            m = null;
                        }
                    }
                    f.push(m);
                    d.push(i);
                }
                a.scriptLoader.load(g, function () {
                    var a = ["beforeInit", "init", "afterInit"];
                    for (var b = 0; b < a.length; b++) for (var g = 0; g < d.length; g++) {
                        var h = d[g];
                        if (0 === b && f[g] && h.lang) e.extend(c.lang, h.langEntries[f[g]]);
                        if (h[a[b]]) h[a[b]](c);
                    }
                    c.fire("pluginsLoaded");
                    q(c);
                });
            });
        }, p = function (b) {
            a.skins.load(b, "editor", function () {
                n(b);
            });
        }, q = function (b) {
            var c = b.config.theme;
            a.themes.load(c, function () {
                var d = b.theme = a.themes.get(c);
                d.path = a.themes.getPath(c);
                d.build(b);
                if (b.config.autoUpdateElement) r(b);
            });
        }, r = function (a) {
            var b = a.element;
            if (1 == a.elementMode && b.is("textarea")) {
                var c = b.$.form && new h(b.$.form);
                if (c) {
                    function d() {
                        a.updateElement();
                    }
                    c.on("submit", d);
                    if (!c.$.submit.nodeName && !c.$.submit.length) c.$.submit = e.override(c.$.submit, function (b) {
                        return function () {
                            a.updateElement();
                            if (b.apply) b.apply(this, arguments); else b();
                        };
                    });
                    a.on("destroy", function () {
                        c.removeListener("submit", d);
                    });
                }
            }
        };
        function s() {
            var a, b = this._.commands, c = this.mode;
            if (!c) return;
            for (var d in b) {
                a = b[d];
                a[a.startDisabled ? "disable" : this.readOnly && !a.readOnly ? "disable" : a.modes[c] ? "enable" : "disable"]();
            }
        }
        a.editor.prototype._init = function () {
            var b = this;
            var c = h.get(b._.element), f = b._.instanceConfig;
            delete b._.element;
            delete b._.instanceConfig;
            b._.commands = {};
            b._.styles = [];
            b.element = c;
            b.name = c && 1 == b.elementMode && (c.getId() || c.getNameAtt()) || d();
            if (b.name in a.instances) throw '[CKEDITOR.editor] The instance "' + b.name + '" already exists.';
            b.id = e.getNextId();
            b.config = e.prototypedCopy(i);
            b.ui = new k(b);
            b.focusManager = new a.focusManager(b);
            a.fire("instanceCreated", null, b);
            b.on("mode", s, null, null, 1);
            b.on("readOnly", s, null, null, 1);
            l(b, f);
        };
    }();
    e.extend(a.editor.prototype, {
        addCommand: function (b, c) {
            return this._.commands[b] = new a.command(this, c);
        },
        addCss: function (a) {
            this._.styles.push(a);
        },
        destroy: function (b) {
            var c = this;
            if (!b) c.updateElement();
            c.fire("destroy");
            c.theme && c.theme.destroy(c);
            a.remove(c);
            a.fire("instanceDestroyed", null, c);
        },
        execCommand: function (a, b) {
            var c = this.getCommand(a), d = {
                name: a,
                commandData: b,
                command: c
            };
            if (c && 0 != c.state) if (true !== this.fire("beforeCommandExec", d)) {
                d.returnValue = c.exec(d.commandData);
                if (!c.async && true !== this.fire("afterCommandExec", d)) return d.returnValue;
            }
            return false;
        },
        getCommand: function (a) {
            return this._.commands[a];
        },
        getData: function () {
            var a = this;
            a.fire("beforeGetData");
            var b = a._.data;
            if ("string" != typeof b) {
                var c = a.element;
                if (c && 1 == a.elementMode) b = c.is("textarea") ? c.getValue() : c.getHtml(); else b = "";
            }
            b = {
                dataValue: b
            };
            a.fire("getData", b);
            return b.dataValue;
        },
        getSnapshot: function () {
            var a = this.fire("getSnapshot");
            if ("string" != typeof a) {
                var b = this.element;
                if (b && 1 == this.elementMode) a = b.is("textarea") ? b.getValue() : b.getHtml();
            }
            return a;
        },
        loadSnapshot: function (a) {
            this.fire("loadSnapshot", a);
        },
        setData: function (a, b, c) {
            if (b) this.on("dataReady", function (a) {
                a.removeListener();
                b.call(a.editor);
            });
            var d = {
                dataValue: a
            };
            !c && this.fire("setData", d);
            this._.data = d.dataValue;
            !c && this.fire("afterSetData", d);
        },
        setReadOnly: function (a) {
            a = void 0 == a || a;
            if (this.readOnly != a) {
                this.readOnly = a;
                this.fire("readOnly");
            }
        },
        insertHtml: function (a) {
            this.fire("insertHtml", a);
        },
        insertText: function (a) {
            this.fire("insertText", a);
        },
        insertElement: function (a) {
            this.fire("insertElement", a);
        },
        checkDirty: function () {
            return this.mayBeDirty && this._.previousValue !== this.getSnapshot();
        },
        resetDirty: function () {
            if (this.mayBeDirty) this._.previousValue = this.getSnapshot();
        },
        updateElement: function () {
            var a = this;
            var b = a.element;
            if (b && 1 == a.elementMode) {
                var c = a.getData();
                if (a.config.htmlEncodeOutput) c = e.htmlEncode(c);
                if (b.is("textarea")) b.setValue(c); else b.setHtml(c);
            }
        }
    });
    a.on("loaded", function () {
        var b = a.editor._pending;
        if (b) {
            delete a.editor._pending;
            for (var c = 0; c < b.length; c++) b[c]._init();
        }
    });
    a.htmlParser = function () {
        this._ = {
            htmlPartsRegex: new RegExp("<(?:(?:\\/([^>]+)>)|(?:!--([\\S|\\s]*?)-->)|(?:([^\\s>]+)\\s*((?:(?:\"[^\"]*\")|(?:'[^']*')|[^\"'>])*)\\/?>))", "g")
        };
    };
    !function () {
        var b = /([\w\-:.]+)(?:(?:\s*=\s*(?:(?:"([^"]*)")|(?:'([^']*)')|([^\s>]+)))|(?=\s|$))/g, c = {
            checked: 1,
            compact: 1,
            declare: 1,
            defer: 1,
            disabled: 1,
            ismap: 1,
            multiple: 1,
            nohref: 1,
            noresize: 1,
            noshade: 1,
            nowrap: 1,
            readonly: 1,
            selected: 1
        };
        a.htmlParser.prototype = {
            onTagOpen: function () { },
            onTagClose: function () { },
            onText: function () { },
            onCDATA: function () { },
            onComment: function () { },
            parse: function (a) {
                var d = this;
                var e, g, h = 0, i;
                while (e = d._.htmlPartsRegex.exec(a)) {
                    var j = e.index;
                    if (j > h) {
                        var k = a.substring(h, j);
                        if (i) i.push(k); else d.onText(k);
                    }
                    h = d._.htmlPartsRegex.lastIndex;
                    if (g = e[1]) {
                        g = g.toLowerCase();
                        if (i && f.$cdata[g]) {
                            d.onCDATA(i.join(""));
                            i = null;
                        }
                        if (!i) {
                            d.onTagClose(g);
                            continue;
                        }
                    }
                    if (i) {
                        i.push(e[0]);
                        continue;
                    }
                    if (g = e[3]) {
                        g = g.toLowerCase();
                        if (/="/.test(g)) continue;
                        var l = {}, m, n = e[4], o = !!(n && "/" == n.charAt(n.length - 1));
                        if (n) while (m = b.exec(n)) {
                            var p = m[1].toLowerCase(), q = m[2] || m[3] || m[4] || "";
                            if (!q && c[p]) l[p] = p; else l[p] = q;
                        }
                        d.onTagOpen(g, l, o);
                        if (!i && f.$cdata[g]) i = [];
                        continue;
                    }
                    if (g = e[2]) d.onComment(g);
                }
                if (a.length > h) d.onText(a.substring(h, a.length));
            }
        };
    }();
    a.htmlParser.comment = function (a) {
        this.value = a;
        this._ = {
            isBlockLike: false
        };
    };
    a.htmlParser.comment.prototype = {
        type: 8,
        writeHtml: function (a, b) {
            var c = this.value;
            if (b) {
                if (!(c = b.onComment(c, this))) return;
                if ("string" != typeof c) {
                    c.parent = this.parent;
                    c.writeHtml(a, b);
                    return;
                }
            }
            a.comment(c);
        }
    };
    !function () {
        a.htmlParser.text = function (a) {
            this.value = a;
            this._ = {
                isBlockLike: false
            };
        };
        a.htmlParser.text.prototype = {
            type: 3,
            writeHtml: function (a, b) {
                var c = this.value;
                if (b && !(c = b.onText(c, this))) return;
                a.text(c);
            }
        };
    }();
    !function () {
        a.htmlParser.cdata = function (a) {
            this.value = a;
        };
        a.htmlParser.cdata.prototype = {
            type: 3,
            writeHtml: function (a) {
                a.write(this.value);
            }
        };
    }();
    a.htmlParser.fragment = function () {
        this.children = [];
        this.parent = null;
        this._ = {
            isBlockLike: true,
            hasInlineStarted: false
        };
    };
    !function () {
        var d = e.extend({
            table: 1,
            ul: 1,
            ol: 1,
            dl: 1
        }, f.table, f.ul, f.ol, f.dl), g = c && b.version < 8 ? {
            dd: 1,
            dt: 1
        } : {}, h = {
            ol: 1,
            ul: 1
        }, i = e.extend({}, {
            html: 1
        }, f.html, f.body, f.head, {
            style: 1,
            script: 1
        });
        function j(a) {
            return "a" == a.name && a.attributes.href || f.$removeEmpty[a.name];
        }
        a.htmlParser.fragment.fromHtml = function (b, k, l) {
            var m = new a.htmlParser(), n = l || new a.htmlParser.fragment(), o = [], p = [], q = n, r = false, s = false;
            function t(a) {
                var b;
                if (o.length > 0) for (var c = 0; c < o.length; c++) {
                    var d = o[c], e = d.name, g = f[e], h = q.name && f[q.name];
                    if ((!h || h[e]) && (!a || !g || g[a] || !f[a])) {
                        if (!b) {
                            u();
                            b = 1;
                        }
                        d = d.clone();
                        d.parent = q;
                        q = d;
                        o.splice(c, 1);
                        c--;
                    } else if (e == q.name) v(q, q.parent, 1), c--;
                }
            }
            function u() {
                while (p.length) v(p.shift(), q);
            }
            function v(a, b, c) {
                if (void 0 !== a.previous) return;
                b = b || q || n;
                var d = q;
                if (k && (!b.type || "body" == b.name)) {
                    var g, h;
                    if (a.attributes && (h = a.attributes["data-cke-real-element-type"])) g = h; else g = a.name;
                    if (g && !(g in f.$body || "body" == g || a.isOrphan)) {
                        q = b;
                        m.onTagOpen(k, {});
                        a.returnPoint = b = q;
                    }
                }
                if (a._.isBlockLike && "pre" != a.name && "textarea" != a.name) {
                    var i = a.children.length, j = a.children[i - 1], l;
                    if (j && 3 == j.type) if (!(l = e.rtrim(j.value))) a.children.length = i - 1; else j.value = l;
                }
                b.add(a);
                if ("pre" == a.name) s = false;
                if ("textarea" == a.name) r = false;
                if (a.returnPoint) {
                    q = a.returnPoint;
                    delete a.returnPoint;
                } else q = c ? b : d;
            }
            m.onTagOpen = function (b, c, e, k) {
                var l = new a.htmlParser.element(b, c);
                if (l.isUnknown && e) l.isEmpty = true;
                l.isOptionalClose = b in g || k;
                if (j(l)) {
                    o.push(l);
                    return;
                } else if ("pre" == b) s = true; else if ("br" == b && s) {
                    q.add(new a.htmlParser.text("\n"));
                    return;
                } else if ("textarea" == b) r = true;
                if ("br" == b) {
                    p.push(l);
                    return;
                }
                while (1) {
                    var n = q.name, w = n ? f[n] || (q._.isBlockLike ? f.div : f.span) : i;
                    if (!l.isUnknown && !q.isUnknown && !w[b]) if (q.isOptionalClose) m.onTagClose(n); else if (b in h && n in h) {
                        var x = q.children, y = x[x.length - 1];
                        if (!(y && "li" == y.name)) v(y = new a.htmlParser.element("li"), q);
                        !l.returnPoint && (l.returnPoint = q);
                        q = y;
                    } else if (b in f.$listItem && n != b) m.onTagOpen("li" == b ? "ul" : "dl", {}, 0, 1); else if (n in d && n != b) {
                        !l.returnPoint && (l.returnPoint = q);
                        q = q.parent;
                    } else {
                        if (n in f.$inline) o.unshift(q);
                        if (q.parent) v(q, q.parent, 1); else {
                            l.isOrphan = 1;
                            break;
                        }
                    } else break;
                }
                t(b);
                u();
                l.parent = q;
                if (l.isEmpty) v(l); else q = l;
            };
            m.onTagClose = function (a) {
                for (var b = o.length - 1; b >= 0; b--) if (a == o[b].name) {
                    o.splice(b, 1);
                    return;
                }
                var c = [], d = [], e = q;
                while (e != n && e.name != a) {
                    if (!e._.isBlockLike) d.unshift(e);
                    c.push(e);
                    e = e.returnPoint || e.parent;
                }
                if (e != n) {
                    for (b = 0; b < c.length; b++) {
                        var f = c[b];
                        v(f, f.parent);
                    }
                    q = e;
                    if (e._.isBlockLike) u();
                    v(e, e.parent);
                    if (e == q) q = q.parent;
                    o = o.concat(d);
                }
                if ("body" == a) k = false;
            };
            m.onText = function (b) {
                if ((!q._.hasInlineStarted || p.length) && !s && !r) {
                    b = e.ltrim(b);
                    if (0 === b.length) return;
                }
                var c = q.name, g = c ? f[c] || (q._.isBlockLike ? f.div : f.span) : i;
                if (!r && !g["#"] && c in d) {
                    m.onTagOpen(c in h ? "li" : "dl" == c ? "dd" : "table" == c ? "tr" : "tr" == c ? "td" : "");
                    m.onText(b);
                    return;
                }
                u();
                t();
                if (k && (!q.type || "body" == q.name) && e.trim(b)) this.onTagOpen(k, {}, 0, 1);
                if (!s && !r) b = b.replace(/[\t\r\n ]{2,}|[\t\r\n]/g, " ");
                q.add(new a.htmlParser.text(b));
            };
            m.onCDATA = function (b) {
                q.add(new a.htmlParser.cdata(b));
            };
            m.onComment = function (b) {
                u();
                t();
                q.add(new a.htmlParser.comment(b));
            };
            m.parse(b);
            u(!c && 1);
            while (q != n) v(q, q.parent, 1);
            return n;
        };
        a.htmlParser.fragment.prototype = {
            add: function (a, b) {
                var c = this;
                isNaN(b) && (b = c.children.length);
                var d = b > 0 ? c.children[b - 1] : null;
                if (d) {
                    if (a._.isBlockLike && 3 == d.type) {
                        d.value = e.rtrim(d.value);
                        if (0 === d.value.length) {
                            c.children.pop();
                            c.add(a);
                            return;
                        }
                    }
                    d.next = a;
                }
                a.previous = d;
                a.parent = c;
                c.children.splice(b, 0, a);
                c._.hasInlineStarted = 3 == a.type || 1 == a.type && !a._.isBlockLike;
            },
            writeHtml: function (b, c) {
                var d;
                this.filterChildren = function () {
                    var b = new a.htmlParser.basicWriter();
                    this.writeChildrenHtml.call(this, b, c, true);
                    var e = b.getHtml();
                    this.children = new a.htmlParser.fragment.fromHtml(e).children;
                    d = 1;
                };
                !this.name && c && c.onFragment(this);
                this.writeChildrenHtml(b, d ? null : c);
            },
            writeChildrenHtml: function (a, b) {
                for (var c = 0; c < this.children.length; c++) this.children[c].writeHtml(a, b);
            }
        };
    }();
    a.htmlParser.element = function (a, b) {
        var c = this;
        c.name = a;
        c.attributes = b || {};
        c.children = [];
        var d = a || "", e = d.match(/^cke:(.*)/);
        e && (d = e[1]);
        var g = !!(f.$nonBodyContent[d] || f.$block[d] || f.$listItem[d] || f.$tableContent[d] || f.$nonEditable[d] || "br" == d);
        c.isEmpty = !!f.$empty[a];
        c.isUnknown = !f[a];
        c._ = {
            isBlockLike: g,
            hasInlineStarted: c.isEmpty || !g
        };
    };
    a.htmlParser.cssStyle = function () {
        var b, c = arguments[0], d = {};
        b = c instanceof a.htmlParser.element ? c.attributes.style : c;
        (b || "").replace(/&quot;/g, '"').replace(/\s*([^ :;]+)\s*:\s*([^;]+)\s*(?=;|$)/g, function (a, b, c) {
            "font-family" == b && (c = c.replace(/["']/g, ""));
            d[b.toLowerCase()] = c;
        });
        return {
            rules: d,
            populate: function (b) {
                var c = this.toString();
                if (c) b instanceof h ? b.setAttribute("style", c) : b instanceof a.htmlParser.element ? b.attributes.style = c : b.style = c;
            },
            toString: function () {
                var a = [];
                for (var b in d) d[b] && a.push(b, ":", d[b], ";");
                return a.join("");
            }
        };
    };
    !function () {
        var b = function (a, b) {
            a = a[0];
            b = b[0];
            return a < b ? -1 : a > b ? 1 : 0;
        };
        a.htmlParser.element.prototype = {
            type: 1,
            add: a.htmlParser.fragment.prototype.add,
            clone: function () {
                return new a.htmlParser.element(this.name, this.attributes);
            },
            writeHtml: function (c, d) {
                var e = this.attributes, f = this, g = f.name, h, i, j, k;
                f.filterChildren = function () {
                    if (!k) {
                        var b = new a.htmlParser.basicWriter();
                        a.htmlParser.fragment.prototype.writeChildrenHtml.call(f, b, d);
                        f.children = new a.htmlParser.fragment.fromHtml(b.getHtml(), 0, f.clone()).children;
                        k = 1;
                    }
                };
                if (d) {
                    for (; ;) {
                        if (!(g = d.onElementName(g))) return;
                        f.name = g;
                        if (!(f = d.onElement(f))) return;
                        f.parent = this.parent;
                        if (f.name == g) break;
                        if (1 != f.type) {
                            f.writeHtml(c, d);
                            return;
                        }
                        g = f.name;
                        if (!g) {
                            for (var l = 0, m = this.children.length; l < m; l++) this.children[l].parent = f.parent;
                            this.writeChildrenHtml.call(f, c, k ? null : d);
                            return;
                        }
                    }
                    e = f.attributes;
                }
                c.openTag(g, e);
                var n = [];
                for (var o = 0; o < 2; o++) for (h in e) {
                    i = h;
                    j = e[h];
                    if (1 == o) n.push([h, j]); else if (d) {
                        for (; ;) if (!(i = d.onAttributeName(h))) {
                            delete e[h];
                            break;
                        } else if (i != h) {
                            delete e[h];
                            h = i;
                            continue;
                        } else break;
                        if (i) if (false === (j = d.onAttribute(f, i, j))) delete e[i]; else e[i] = j;
                    }
                }
                if (c.sortAttributes) n.sort(b);
                var p = n.length;
                for (o = 0; o < p; o++) {
                    var q = n[o];
                    c.attribute(q[0], q[1]);
                }
                c.openTagClose(g, f.isEmpty);
                if (!f.isEmpty) {
                    this.writeChildrenHtml.call(f, c, k ? null : d);
                    c.closeTag(g);
                }
            },
            writeChildrenHtml: function (b, c) {
                a.htmlParser.fragment.prototype.writeChildrenHtml.apply(this, arguments);
            }
        };
    }();
    !function () {
        a.htmlParser.filter = e.createClass({
            $: function (a) {
                this._ = {
                    elementNames: [],
                    attributeNames: [],
                    elements: {
                        $length: 0
                    },
                    attributes: {
                        $length: 0
                    }
                };
                if (a) this.addRules(a, 10);
            },
            proto: {
                addRules: function (a, b) {
                    var e = this;
                    if ("number" != typeof b) b = 10;
                    c(e._.elementNames, a.elementNames, b);
                    c(e._.attributeNames, a.attributeNames, b);
                    d(e._.elements, a.elements, b);
                    d(e._.attributes, a.attributes, b);
                    e._.text = f(e._.text, a.text, b) || e._.text;
                    e._.comment = f(e._.comment, a.comment, b) || e._.comment;
                    e._.root = f(e._.root, a.root, b) || e._.root;
                },
                onElementName: function (a) {
                    return b(a, this._.elementNames);
                },
                onAttributeName: function (a) {
                    return b(a, this._.attributeNames);
                },
                onText: function (a) {
                    var b = this._.text;
                    return b ? b.filter(a) : a;
                },
                onComment: function (a, b) {
                    var c = this._.comment;
                    return c ? c.filter(a, b) : a;
                },
                onFragment: function (a) {
                    var b = this._.root;
                    return b ? b.filter(a) : a;
                },
                onElement: function (a) {
                    var b = this;
                    var c = [b._.elements["^"], b._.elements[a.name], b._.elements.$], d, e;
                    for (var f = 0; f < 3; f++) {
                        d = c[f];
                        if (d) {
                            e = d.filter(a, b);
                            if (false === e) return null;
                            if (e && e != a) return b.onNode(e);
                            if (a.parent && !a.name) break;
                        }
                    }
                    return a;
                },
                onNode: function (b) {
                    var c = b.type;
                    return 1 == c ? this.onElement(b) : 3 == c ? new a.htmlParser.text(this.onText(b.value)) : 8 == c ? new a.htmlParser.comment(this.onComment(b.value)) : null;
                },
                onAttribute: function (a, b, c) {
                    var d = this._.attributes[b];
                    if (d) {
                        var e = d.filter(c, a, this);
                        if (false === e) return false;
                        if ("undefined" != typeof e) return e;
                    }
                    return c;
                }
            }
        });
        function b(a, b) {
            for (var c = 0; a && c < b.length; c++) {
                var d = b[c];
                a = a.replace(d[0], d[1]);
            }
            return a;
        }
        function c(a, b, c) {
            if ("function" == typeof b) b = [b];
            var d, e, f = a.length, g = b && b.length;
            if (g) {
                for (d = 0; d < f && a[d].pri < c; d++);
                for (e = g - 1; e >= 0; e--) {
                    var h = b[e];
                    if (h) {
                        h.pri = c;
                        a.splice(d, 0, h);
                    }
                }
            }
        }
        function d(a, b, c) {
            if (b) for (var d in b) {
                var e = a[d];
                a[d] = f(e, b[d], c);
                if (!e) a.$length++;
            }
        }
        function f(a, b, d) {
            if (b) {
                b.pri = d;
                if (a) {
                    if (!a.splice) {
                        if (a.pri > d) a = [b, a]; else a = [a, b];
                        a.filter = g;
                    } else c(a, b, d);
                    return a;
                } else {
                    b.filter = b;
                    return b;
                }
            }
        }
        function g(b) {
            var c = b.type || b instanceof a.htmlParser.fragment;
            for (var d = 0; d < this.length; d++) {
                if (c) var e = b.type, f = b.name;
                var g = this[d], h = g.apply(window, arguments);
                if (false === h) return h;
                if (c) {
                    if (h && (h.name != f || h.type != e)) return h;
                } else if ("string" != typeof h) return h;
                void 0 != h && (b = h);
            }
            return b;
        }
    }();
    a.htmlParser.basicWriter = e.createClass({
        $: function () {
            this._ = {
                output: []
            };
        },
        proto: {
            openTag: function (a, b) {
                this._.output.push("<", a);
            },
            openTagClose: function (a, b) {
                if (b) this._.output.push(" />"); else this._.output.push(">");
            },
            attribute: function (a, b) {
                if ("string" == typeof b) b = e.htmlEncodeAttr(b);
                this._.output.push(" ", a, '="', b, '"');
            },
            closeTag: function (a) {
                this._.output.push("</", a, ">");
            },
            text: function (a) {
                this._.output.push(a);
            },
            comment: function (a) {
                this._.output.push("<!--", a, "-->");
            },
            write: function (a) {
                this._.output.push(a);
            },
            reset: function () {
                this._.output = [];
                this._.indent = false;
            },
            getHtml: function (a) {
                var b = this._.output.join("");
                if (a) this.reset();
                return b;
            }
        }
    });
    delete a.loadFullCore;
    a.instances = {};
    a.document = new g(document);
    a.add = function (b) {
        a.instances[b.name] = b;
        b.on("focus", function () {
            if (a.currentInstance != b) {
                a.currentInstance = b;
                a.fire("currentInstance");
            }
        });
        b.on("blur", function () {
            if (a.currentInstance == b) {
                a.currentInstance = null;
                a.fire("currentInstance");
            }
        });
    };
    a.remove = function (b) {
        delete a.instances[b.name];
    };
    a.on("instanceDestroyed", function () {
        if (e.isEmpty(this.instances)) a.fire("reset");
    });
    a.TRISTATE_ON = 1;
    a.TRISTATE_OFF = 2;
    a.TRISTATE_DISABLED = 0;
    d.comment = function (a, b) {
        if ("string" == typeof a) a = (b ? b.$ : document).createComment(a);
        d.domObject.call(this, a);
    };
    d.comment.prototype = new d.node();
    e.extend(d.comment.prototype, {
        type: 8,
        getOuterHtml: function () {
            return "<!--" + this.$.nodeValue + "-->";
        }
    });
    !function () {
        var a = {
            address: 1,
            blockquote: 1,
            dl: 1,
            h1: 1,
            h2: 1,
            h3: 1,
            h4: 1,
            h5: 1,
            h6: 1,
            p: 1,
            pre: 1,
            li: 1,
            dt: 1,
            dd: 1,
            legend: 1,
            caption: 1
        }, b = {
            body: 1,
            div: 1,
            table: 1,
            tbody: 1,
            tr: 1,
            td: 1,
            th: 1,
            form: 1,
            fieldset: 1
        }, c = function (a) {
            var b = a.getChildren();
            for (var c = 0, d = b.count(); c < d; c++) {
                var e = b.getItem(c);
                if (1 == e.type && f.$block[e.getName()]) return true;
            }
            return false;
        };
        d.elementPath = function (d) {
            var e = this;
            var f = null, g = null, h = [], i = d;
            while (i) {
                if (1 == i.type) {
                    if (!e.lastElement) e.lastElement = i;
                    var j = i.getName();
                    if (!g) {
                        if (!f && a[j]) f = i;
                        if (b[j]) if (!f && "div" == j && !c(i)) f = i; else g = i;
                    }
                    h.push(i);
                    if ("body" == j) break;
                }
                i = i.getParent();
            }
            e.block = f;
            e.blockLimit = g;
            e.elements = h;
        };
    }();
    d.elementPath.prototype = {
        compare: function (a) {
            var b = this.elements, c = a && a.elements;
            if (!c || b.length != c.length) return false;
            for (var d = 0; d < b.length; d++) if (!b[d].equals(c[d])) return false;
            return true;
        },
        contains: function (a) {
            var b = this.elements;
            for (var c = 0; c < b.length; c++) if (b[c].getName() in a) return b[c];
            return null;
        }
    };
    d.text = function (a, b) {
        if ("string" == typeof a) a = (b ? b.$ : document).createTextNode(a);
        this.$ = a;
    };
    d.text.prototype = new d.node();
    e.extend(d.text.prototype, {
        type: 3,
        getLength: function () {
            return this.$.nodeValue.length;
        },
        getText: function () {
            return this.$.nodeValue;
        },
        setText: function (a) {
            this.$.nodeValue = a;
        },
        split: function (a) {
            var e = this;
            if (c && a == e.getLength()) {
                var f = e.getDocument().createText("");
                f.insertAfter(e);
                return f;
            }
            var g = e.getDocument(), h = new d.text(e.$.splitText(a), g);
            if (b.ie8) {
                var i = new d.text("", g);
                i.insertAfter(h);
                i.remove();
            }
            return h;
        },
        substring: function (a, b) {
            if ("number" != typeof b) return this.$.nodeValue.substr(a); else return this.$.nodeValue.substring(a, b);
        }
    });
    d.documentFragment = function (b) {
        b = b || a.document;
        this.$ = b.$.createDocumentFragment();
    };
    e.extend(d.documentFragment.prototype, h.prototype, {
        type: 11,
        insertAfterNode: function (a) {
            a = a.$;
            a.parentNode.insertBefore(this.$, a.nextSibling);
        }
    }, true, {
        append: 1,
        appendBogus: 1,
        getFirst: 1,
        getLast: 1,
        appendTo: 1,
        moveChildren: 1,
        insertBefore: 1,
        insertAfterNode: 1,
        replace: 1,
        trim: 1,
        type: 1,
        ltrim: 1,
        rtrim: 1,
        getDocument: 1,
        getChildCount: 1,
        getChild: 1,
        getChildren: 1
    });
    !function () {
        function a(a, b) {
            var c = this.range;
            if (this._.end) return null;
            if (!this._.start) {
                this._.start = 1;
                if (c.collapsed) {
                    this.end();
                    return null;
                }
                c.optimize();
            }
            var d, e = c.startContainer, f = c.endContainer, g = c.startOffset, h = c.endOffset, i, j = this.guard, k = this.type, l = a ? "getPreviousSourceNode" : "getNextSourceNode";
            if (!a && !this._.guardLTR) {
                var m = 1 == f.type ? f : f.getParent(), n = 1 == f.type ? f.getChild(h) : f.getNext();
                this._.guardLTR = function (a, b) {
                    return (!b || !m.equals(a)) && (!n || !a.equals(n)) && (1 != a.type || !b || "body" != a.getName());
                };
            }
            if (a && !this._.guardRTL) {
                var o = 1 == e.type ? e : e.getParent(), p = 1 == e.type ? g ? e.getChild(g - 1) : null : e.getPrevious();
                this._.guardRTL = function (a, b) {
                    return (!b || !o.equals(a)) && (!p || !a.equals(p)) && (1 != a.type || !b || "body" != a.getName());
                };
            }
            var q = a ? this._.guardRTL : this._.guardLTR;
            if (j) i = function (a, b) {
                if (false === q(a, b)) return false;
                return j(a, b);
            }; else i = q;
            if (this.current) d = this.current[l](false, k, i); else {
                if (a) {
                    d = f;
                    if (1 == d.type) if (h > 0) d = d.getChild(h - 1); else d = false === i(d, true) ? null : d.getPreviousSourceNode(true, k, i);
                } else {
                    d = e;
                    if (1 == d.type) if (!(d = d.getChild(g))) d = false === i(e, true) ? null : e.getNextSourceNode(true, k, i);
                }
                if (d && false === i(d)) d = null;
            }
            while (d && !this._.end) {
                this.current = d;
                if (!this.evaluator || false !== this.evaluator(d)) {
                    if (!b) return d;
                } else if (b && this.evaluator) return false;
                d = d[l](false, k, i);
            }
            this.end();
            return this.current = null;
        }
        function g(b) {
            var c, d = null;
            while (c = a.call(this, b)) d = c;
            return d;
        }
        d.walker = e.createClass({
            $: function (a) {
                this.range = a;
                this._ = {};
            },
            proto: {
                end: function () {
                    this._.end = 1;
                },
                next: function () {
                    return a.call(this);
                },
                previous: function () {
                    return a.call(this, 1);
                },
                checkForward: function () {
                    return false !== a.call(this, 0, 1);
                },
                checkBackward: function () {
                    return false !== a.call(this, 1, 1);
                },
                lastForward: function () {
                    return g.call(this);
                },
                lastBackward: function () {
                    return g.call(this, 1);
                },
                reset: function () {
                    delete this.current;
                    this._ = {};
                }
            }
        });
        var i = {
            block: 1,
            "list-item": 1,
            table: 1,
            "table-row-group": 1,
            "table-header-group": 1,
            "table-footer-group": 1,
            "table-row": 1,
            "table-column-group": 1,
            "table-column": 1,
            "table-cell": 1,
            "table-caption": 1
        };
        h.prototype.isBlockBoundary = function (a) {
            var b = a ? e.extend({}, f.$block, a || {}) : f.$block;
            return "none" == this.getComputedStyle("float") && i[this.getComputedStyle("display")] || b[this.getName()];
        };
        d.walker.blockBoundary = function (a) {
            return function (b, c) {
                return !(1 == b.type && b.isBlockBoundary(a));
            };
        };
        d.walker.listItemBoundary = function () {
            return this.blockBoundary({
                br: 1
            });
        };
        d.walker.bookmark = function (a, b) {
            function c(a) {
                return a && a.getName && "span" == a.getName() && a.data("cke-bookmark");
            }
            return function (d) {
                var e, f;
                e = d && !d.getName && (f = d.getParent()) && c(f);
                e = a ? e : e || c(d);
                return !!(b ^ e);
            };
        };
        d.walker.whitespaces = function (a) {
            return function (c) {
                var d;
                if (c && 3 == c.type) d = !e.trim(c.getText()) || b.webkit && "​" == c.getText();
                return !!(a ^ d);
            };
        };
        d.walker.invisible = function (a) {
            var b = d.walker.whitespaces();
            return function (c) {
                var d;
                if (b(c)) d = 1; else {
                    if (3 == c.type) c = c.getParent();
                    d = !c.$.offsetHeight;
                }
                return !!(a ^ d);
            };
        };
        d.walker.nodeType = function (a, b) {
            return function (c) {
                return !!(b ^ c.type == a);
            };
        };
        d.walker.bogus = function (a) {
            function b(a) {
                return !k(a) && !l(a);
            }
            return function (d) {
                var e = !c ? d.is && d.is("br") : d.getText && j.test(d.getText());
                if (e) {
                    var f = d.getParent(), g = d.getNext(b);
                    e = f.isBlockBoundary() && (!g || 1 == g.type && g.isBlockBoundary());
                }
                return !!(a ^ e);
            };
        };
        var j = /^[\t\r\n ]*(?:&nbsp;|\xa0)$/, k = d.walker.whitespaces(), l = d.walker.bookmark(), m = function (a) {
            return l(a) || k(a) || 1 == a.type && a.getName() in f.$inline && !(a.getName() in f.$empty);
        };
        h.prototype.getBogus = function () {
            var a = this;
            do a = a.getPreviousSourceNode(); while (m(a));
            if (a && (!c ? a.is && a.is("br") : a.getText && j.test(a.getText()))) return a;
            return false;
        };
    }();
    d.range = function (a) {
        var b = this;
        b.startContainer = null;
        b.startOffset = null;
        b.endContainer = null;
        b.endOffset = null;
        b.collapsed = true;
        b.document = a;
    };
    !function () {
        var a = function (a) {
            a.collapsed = a.startContainer && a.endContainer && a.startContainer.equals(a.endContainer) && a.startOffset == a.endOffset;
        }, b = function (a, b, c, d) {
            a.optimizeBookmark();
            var e = a.startContainer, f = a.endContainer, g = a.startOffset, i = a.endOffset, j, k;
            if (3 == f.type) f = f.split(i); else if (f.getChildCount() > 0) if (i >= f.getChildCount()) {
                f = f.append(a.document.createText(""));
                k = true;
            } else f = f.getChild(i);
            if (3 == e.type) {
                e.split(g);
                if (e.equals(f)) f = e.getNext();
            } else if (!g) {
                e = e.getFirst().insertBeforeMe(a.document.createText(""));
                j = true;
            } else if (g >= e.getChildCount()) {
                e = e.append(a.document.createText(""));
                j = true;
            } else e = e.getChild(g).getPrevious();
            var l = e.getParents(), m = f.getParents(), n, o, p;
            for (n = 0; n < l.length; n++) {
                o = l[n];
                p = m[n];
                if (!o.equals(p)) break;
            }
            var q = c, r, s, t, u;
            for (var v = n; v < l.length; v++) {
                r = l[v];
                if (q && !r.equals(e)) s = q.append(r.clone());
                t = r.getNext();
                while (t) {
                    if (t.equals(m[v]) || t.equals(f)) break;
                    u = t.getNext();
                    if (2 == b) q.append(t.clone(true)); else {
                        t.remove();
                        if (1 == b) q.append(t);
                    }
                    t = u;
                }
                if (q) q = s;
            }
            q = c;
            for (var w = n; w < m.length; w++) {
                r = m[w];
                if (b > 0 && !r.equals(f)) s = q.append(r.clone());
                if (!l[w] || r.$.parentNode != l[w].$.parentNode) {
                    t = r.getPrevious();
                    while (t) {
                        if (t.equals(l[w]) || t.equals(e)) break;
                        u = t.getPrevious();
                        if (2 == b) q.$.insertBefore(t.$.cloneNode(true), q.$.firstChild); else {
                            t.remove();
                            if (1 == b) q.$.insertBefore(t.$, q.$.firstChild);
                        }
                        t = u;
                    }
                }
                if (q) q = s;
            }
            if (2 == b) {
                var x = a.startContainer;
                if (3 == x.type) {
                    x.$.data += x.$.nextSibling.data;
                    x.$.parentNode.removeChild(x.$.nextSibling);
                }
                var y = a.endContainer;
                if (3 == y.type && y.$.nextSibling) {
                    y.$.data += y.$.nextSibling.data;
                    y.$.parentNode.removeChild(y.$.nextSibling);
                }
            } else {
                if (o && p && (e.$.parentNode != o.$.parentNode || f.$.parentNode != p.$.parentNode)) {
                    var z = p.getIndex();
                    if (j && p.$.parentNode == e.$.parentNode) z--;
                    if (d && 1 == o.type) {
                        var A = h.createFromHtml('<span data-cke-bookmark="1" style="display:none">&nbsp;</span>', a.document);
                        A.insertAfter(o);
                        o.mergeSiblings(false);
                        a.moveToBookmark({
                            startNode: A
                        });
                    } else a.setStart(p.getParent(), z);
                }
                a.collapse(true);
            }
            if (j) e.remove();
            if (k && f.$.parentNode) f.remove();
        }, g = {
            abbr: 1,
            acronym: 1,
            b: 1,
            bdo: 1,
            big: 1,
            cite: 1,
            code: 1,
            del: 1,
            dfn: 1,
            em: 1,
            font: 1,
            i: 1,
            ins: 1,
            label: 1,
            kbd: 1,
            q: 1,
            samp: 1,
            small: 1,
            span: 1,
            strike: 1,
            strong: 1,
            sub: 1,
            sup: 1,
            tt: 1,
            u: 1,
            "var": 1
        };
        function i() {
            var a = false, b = d.walker.whitespaces(), c = d.walker.bookmark(true), f = d.walker.bogus();
            return function (d) {
                if (c(d) || b(d)) return true;
                if (f(d) && !a) {
                    a = true;
                    return true;
                }
                if (3 == d.type && (d.hasAscendant("pre") || e.trim(d.getText()).length)) return false;
                if (1 == d.type && !g[d.getName()]) return false;
                return true;
            };
        }
        var j = d.walker.bogus();
        function k(a) {
            var b = d.walker.whitespaces(), c = d.walker.bookmark(1);
            return function (d) {
                if (c(d) || b(d)) return true;
                return !a && j(d) || 1 == d.type && d.getName() in f.$removeEmpty;
            };
        }
        var l = new d.walker.whitespaces(), m = new d.walker.bookmark(), n = /^[\t\r\n ]*(?:&nbsp;|\xa0)$/;
        function o(a) {
            return !l(a) && !m(a);
        }
        d.range.prototype = {
            clone: function () {
                var a = this;
                var b = new d.range(a.document);
                b.startContainer = a.startContainer;
                b.startOffset = a.startOffset;
                b.endContainer = a.endContainer;
                b.endOffset = a.endOffset;
                b.collapsed = a.collapsed;
                return b;
            },
            collapse: function (a) {
                var b = this;
                if (a) {
                    b.endContainer = b.startContainer;
                    b.endOffset = b.startOffset;
                } else {
                    b.startContainer = b.endContainer;
                    b.startOffset = b.endOffset;
                }
                b.collapsed = true;
            },
            cloneContents: function () {
                var a = new d.documentFragment(this.document);
                if (!this.collapsed) b(this, 2, a);
                return a;
            },
            deleteContents: function (a) {
                if (this.collapsed) return;
                b(this, 0, null, a);
            },
            extractContents: function (a) {
                var c = new d.documentFragment(this.document);
                if (!this.collapsed) b(this, 1, c, a);
                return c;
            },
            createBookmark: function (a) {
                var b = this;
                var c, d, f, g, h = b.collapsed;
                c = b.document.createElement("span");
                c.data("cke-bookmark", 1);
                c.setStyle("display", "none");
                c.setHtml("&nbsp;");
                if (a) {
                    f = "cke_bm_" + e.getNextNumber();
                    c.setAttribute("id", f + (h ? "C" : "S"));
                }
                if (!h) {
                    d = c.clone();
                    d.setHtml("&nbsp;");
                    if (a) d.setAttribute("id", f + "E");
                    g = b.clone();
                    g.collapse();
                    g.insertNode(d);
                }
                g = b.clone();
                g.collapse(true);
                g.insertNode(c);
                if (d) {
                    b.setStartAfter(c);
                    b.setEndBefore(d);
                } else b.moveToPosition(c, 4);
                return {
                    startNode: a ? f + (h ? "C" : "S") : c,
                    endNode: a ? f + "E" : d,
                    serializable: a,
                    collapsed: h
                };
            },
            createBookmark2: function (a) {
                var b = this;
                var c = b.startContainer, d = b.endContainer, e = b.startOffset, f = b.endOffset, g = b.collapsed, h, i;
                if (!c || !d) return {
                    start: 0,
                    end: 0
                };
                if (a) {
                    if (1 == c.type) {
                        h = c.getChild(e);
                        if (h && 3 == h.type && e > 0 && 3 == h.getPrevious().type) {
                            c = h;
                            e = 0;
                        }
                        if (h && 1 == h.type) e = h.getIndex(1);
                    }
                    while (3 == c.type && (i = c.getPrevious()) && 3 == i.type) {
                        c = i;
                        e += i.getLength();
                    }
                    if (!g) {
                        if (1 == d.type) {
                            h = d.getChild(f);
                            if (h && 3 == h.type && f > 0 && 3 == h.getPrevious().type) {
                                d = h;
                                f = 0;
                            }
                            if (h && 1 == h.type) f = h.getIndex(1);
                        }
                        while (3 == d.type && (i = d.getPrevious()) && 3 == i.type) {
                            d = i;
                            f += i.getLength();
                        }
                    }
                }
                return {
                    start: c.getAddress(a),
                    end: g ? null : d.getAddress(a),
                    startOffset: e,
                    endOffset: f,
                    normalized: a,
                    collapsed: g,
                    is2: true
                };
            },
            moveToBookmark: function (a) {
                var b = this;
                if (a.is2) {
                    var c = b.document.getByAddress(a.start, a.normalized), d = a.startOffset, e = a.end && b.document.getByAddress(a.end, a.normalized), f = a.endOffset;
                    b.setStart(c, d);
                    if (e) b.setEnd(e, f); else b.collapse(true);
                } else {
                    var g = a.serializable, h = g ? b.document.getById(a.startNode) : a.startNode, i = g ? b.document.getById(a.endNode) : a.endNode;
                    b.setStartBefore(h);
                    h.remove();
                    if (i) {
                        b.setEndBefore(i);
                        i.remove();
                    } else b.collapse(true);
                }
            },
            getBoundaryNodes: function () {
                var a = this;
                var b = a.startContainer, c = a.endContainer, e = a.startOffset, f = a.endOffset, g;
                if (1 == b.type) {
                    g = b.getChildCount();
                    if (g > e) b = b.getChild(e); else if (g < 1) b = b.getPreviousSourceNode(); else {
                        b = b.$;
                        while (b.lastChild) b = b.lastChild;
                        b = new d.node(b);
                        b = b.getNextSourceNode() || b;
                    }
                }
                if (1 == c.type) {
                    g = c.getChildCount();
                    if (g > f) c = c.getChild(f).getPreviousSourceNode(true); else if (g < 1) c = c.getPreviousSourceNode(); else {
                        c = c.$;
                        while (c.lastChild) c = c.lastChild;
                        c = new d.node(c);
                    }
                }
                if (2 & b.getPosition(c)) b = c;
                return {
                    startNode: b,
                    endNode: c
                };
            },
            getCommonAncestor: function (a, b) {
                var c = this;
                var d = c.startContainer, e = c.endContainer, f;
                if (d.equals(e)) if (a && 1 == d.type && c.startOffset == c.endOffset - 1) f = d.getChild(c.startOffset); else f = d; else f = d.getCommonAncestor(e);
                return b && !f.is ? f.getParent() : f;
            },
            optimize: function () {
                var a = this;
                var b = a.startContainer, c = a.startOffset;
                if (1 != b.type) if (!c) a.setStartBefore(b); else if (c >= b.getLength()) a.setStartAfter(b);
                b = a.endContainer;
                c = a.endOffset;
                if (1 != b.type) if (!c) a.setEndBefore(b); else if (c >= b.getLength()) a.setEndAfter(b);
            },
            optimizeBookmark: function () {
                var a = this;
                var b = a.startContainer, c = a.endContainer;
                if (b.is && b.is("span") && b.data("cke-bookmark")) a.setStartAt(b, 3);
                if (c && c.is && c.is("span") && c.data("cke-bookmark")) a.setEndAt(c, 4);
            },
            trim: function (a, b) {
                var c = this;
                var d = c.startContainer, e = c.startOffset, f = c.collapsed;
                if ((!a || f) && d && 3 == d.type) {
                    if (!e) {
                        e = d.getIndex();
                        d = d.getParent();
                    } else if (e >= d.getLength()) {
                        e = d.getIndex() + 1;
                        d = d.getParent();
                    } else {
                        var g = d.split(e);
                        e = d.getIndex() + 1;
                        d = d.getParent();
                        if (c.startContainer.equals(c.endContainer)) c.setEnd(g, c.endOffset - c.startOffset); else if (d.equals(c.endContainer)) c.endOffset += 1;
                    }
                    c.setStart(d, e);
                    if (f) {
                        c.collapse(true);
                        return;
                    }
                }
                var h = c.endContainer, i = c.endOffset;
                if (!(b || f) && h && 3 == h.type) {
                    if (!i) {
                        i = h.getIndex();
                        h = h.getParent();
                    } else if (i >= h.getLength()) {
                        i = h.getIndex() + 1;
                        h = h.getParent();
                    } else {
                        h.split(i);
                        i = h.getIndex() + 1;
                        h = h.getParent();
                    }
                    c.setEnd(h, i);
                }
            },
            enlarge: function (a, b) {
                switch (a) {
                    case 1:
                        if (this.collapsed) return;
                        var c = this.getCommonAncestor(), g = this.document.getBody(), h, i, j, k, l, m = false, n, o, p = this.startContainer, q = this.startOffset;
                        if (3 == p.type) {
                            if (q) {
                                p = !e.trim(p.substring(0, q)).length && p;
                                m = !!p;
                            }
                            if (p) if (!(k = p.getPrevious())) j = p.getParent();
                        } else {
                            if (q) k = p.getChild(q - 1) || p.getLast();
                            if (!k) j = p;
                        }
                        while (j || k) {
                            if (j && !k) {
                                if (!l && j.equals(c)) l = true;
                                if (!g.contains(j)) break;
                                if (!m || "inline" != j.getComputedStyle("display")) {
                                    m = false;
                                    if (l) h = j; else this.setStartBefore(j);
                                }
                                k = j.getPrevious();
                            }
                            while (k) {
                                n = false;
                                if (8 == k.type) {
                                    k = k.getPrevious();
                                    continue;
                                } else if (3 == k.type) {
                                    o = k.getText();
                                    if (/[^\s\ufeff]/.test(o)) k = null;
                                    n = /[\s\ufeff]$/.test(o);
                                } else if ((k.$.offsetWidth > 0 || b && k.is("br")) && !k.data("cke-bookmark")) if (m && f.$removeEmpty[k.getName()]) {
                                    o = k.getText();
                                    if (/[^\s\ufeff]/.test(o)) k = null; else {
                                        var r = k.$.getElementsByTagName("*");
                                        for (var s = 0, t; t = r[s++];) if (!f.$removeEmpty[t.nodeName.toLowerCase()]) {
                                            k = null;
                                            break;
                                        }
                                    }
                                    if (k) n = !!o.length;
                                } else k = null;
                                if (n) if (m) {
                                    if (l) h = j; else if (j) this.setStartBefore(j);
                                } else m = true;
                                if (k) {
                                    var u = k.getPrevious();
                                    if (!j && !u) {
                                        j = k;
                                        k = null;
                                        break;
                                    }
                                    k = u;
                                } else j = null;
                            }
                            if (j) j = j.getParent();
                        }
                        p = this.endContainer;
                        q = this.endOffset;
                        j = k = null;
                        l = m = false;
                        if (3 == p.type) {
                            p = !e.trim(p.substring(q)).length && p;
                            m = !(p && p.getLength());
                            if (p) if (!(k = p.getNext())) j = p.getParent();
                        } else {
                            k = p.getChild(q);
                            if (!k) j = p;
                        }
                        while (j || k) {
                            if (j && !k) {
                                if (!l && j.equals(c)) l = true;
                                if (!g.contains(j)) break;
                                if (!m || "inline" != j.getComputedStyle("display")) {
                                    m = false;
                                    if (l) i = j; else if (j) this.setEndAfter(j);
                                }
                                k = j.getNext();
                            }
                            while (k) {
                                n = false;
                                if (3 == k.type) {
                                    o = k.getText();
                                    if (/[^\s\ufeff]/.test(o)) k = null;
                                    n = /^[\s\ufeff]/.test(o);
                                } else if (1 == k.type) {
                                    if ((k.$.offsetWidth > 0 || b && k.is("br")) && !k.data("cke-bookmark")) if (m && f.$removeEmpty[k.getName()]) {
                                        o = k.getText();
                                        if (/[^\s\ufeff]/.test(o)) k = null; else {
                                            r = k.$.getElementsByTagName("*");
                                            for (s = 0; t = r[s++];) if (!f.$removeEmpty[t.nodeName.toLowerCase()]) {
                                                k = null;
                                                break;
                                            }
                                        }
                                        if (k) n = !!o.length;
                                    } else k = null;
                                } else n = 1;
                                if (n) if (m) if (l) i = j; else this.setEndAfter(j);
                                if (k) {
                                    u = k.getNext();
                                    if (!j && !u) {
                                        j = k;
                                        k = null;
                                        break;
                                    }
                                    k = u;
                                } else j = null;
                            }
                            if (j) j = j.getParent();
                        }
                        if (h && i) {
                            c = h.contains(i) ? i : h;
                            this.setStartBefore(c);
                            this.setEndAfter(c);
                        }
                        break;

                    case 2:
                    case 3:
                        var v = new d.range(this.document);
                        g = this.document.getBody();
                        v.setStartAt(g, 1);
                        v.setEnd(this.startContainer, this.startOffset);
                        var w = new d.walker(v), x, y, z = d.walker.blockBoundary(3 == a ? {
                            br: 1
                        } : null), A = function (a) {
                            var b = z(a);
                            if (!b) x = a;
                            return b;
                        }, B = function (a) {
                            var b = A(a);
                            if (!b && a.is && a.is("br")) y = a;
                            return b;
                        };
                        w.guard = A;
                        j = w.lastBackward();
                        x = x || g;
                        this.setStartAt(x, !x.is("br") && (!j && this.checkStartOfBlock() || j && x.contains(j)) ? 1 : 4);
                        if (3 == a) {
                            var C = this.clone();
                            w = new d.walker(C);
                            var D = d.walker.whitespaces(), E = d.walker.bookmark();
                            w.evaluator = function (a) {
                                return !D(a) && !E(a);
                            };
                            var F = w.previous();
                            if (F && 1 == F.type && F.is("br")) return;
                        }
                        v = this.clone();
                        v.collapse();
                        v.setEndAt(g, 2);
                        w = new d.walker(v);
                        w.guard = 3 == a ? B : A;
                        x = null;
                        j = w.lastForward();
                        x = x || g;
                        this.setEndAt(x, !j && this.checkEndOfBlock() || j && x.contains(j) ? 2 : 3);
                        if (y) this.setEndAfter(y);
                }
            },
            shrink: function (a, b) {
                if (!this.collapsed) {
                    a = a || 2;
                    var c = this.clone(), e = this.startContainer, f = this.endContainer, g = this.startOffset, h = this.endOffset, i = this.collapsed, j = 1, k = 1;
                    if (e && 3 == e.type) if (!g) c.setStartBefore(e); else if (g >= e.getLength()) c.setStartAfter(e); else {
                        c.setStartBefore(e);
                        j = 0;
                    }
                    if (f && 3 == f.type) if (!h) c.setEndBefore(f); else if (h >= f.getLength()) c.setEndAfter(f); else {
                        c.setEndAfter(f);
                        k = 0;
                    }
                    var l = new d.walker(c), m = d.walker.bookmark();
                    l.evaluator = function (b) {
                        return b.type == (1 == a ? 1 : 3);
                    };
                    var n;
                    l.guard = function (b, c) {
                        if (m(b)) return true;
                        if (1 == a && 3 == b.type) return false;
                        if (c && b.equals(n)) return false;
                        if (!c && 1 == b.type) n = b;
                        return true;
                    };
                    if (j) {
                        var o = l[1 == a ? "lastForward" : "next"]();
                        o && this.setStartAt(o, b ? 1 : 3);
                    }
                    if (k) {
                        l.reset();
                        var p = l[1 == a ? "lastBackward" : "previous"]();
                        p && this.setEndAt(p, b ? 2 : 4);
                    }
                    return !!(j || k);
                }
            },
            insertNode: function (a) {
                var b = this;
                b.optimizeBookmark();
                b.trim(false, true);
                var c = b.startContainer, d = b.startOffset, e = c.getChild(d);
                if (e) a.insertBefore(e); else c.append(a);
                if (a.getParent().equals(b.endContainer)) b.endOffset++;
                b.setStartBefore(a);
            },
            moveToPosition: function (a, b) {
                this.setStartAt(a, b);
                this.collapse(true);
            },
            selectNodeContents: function (a) {
                this.setStart(a, 0);
                this.setEnd(a, 3 == a.type ? a.getLength() : a.getChildCount());
            },
            setStart: function (b, c) {
                var d = this;
                if (1 == b.type && f.$empty[b.getName()]) c = b.getIndex(), b = b.getParent();
                d.startContainer = b;
                d.startOffset = c;
                if (!d.endContainer) {
                    d.endContainer = b;
                    d.endOffset = c;
                }
                a(d);
            },
            setEnd: function (b, c) {
                var d = this;
                if (1 == b.type && f.$empty[b.getName()]) c = b.getIndex() + 1, b = b.getParent();
                d.endContainer = b;
                d.endOffset = c;
                if (!d.startContainer) {
                    d.startContainer = b;
                    d.startOffset = c;
                }
                a(d);
            },
            setStartAfter: function (a) {
                this.setStart(a.getParent(), a.getIndex() + 1);
            },
            setStartBefore: function (a) {
                this.setStart(a.getParent(), a.getIndex());
            },
            setEndAfter: function (a) {
                this.setEnd(a.getParent(), a.getIndex() + 1);
            },
            setEndBefore: function (a) {
                this.setEnd(a.getParent(), a.getIndex());
            },
            setStartAt: function (b, c) {
                var d = this;
                switch (c) {
                    case 1:
                        d.setStart(b, 0);
                        break;

                    case 2:
                        if (3 == b.type) d.setStart(b, b.getLength()); else d.setStart(b, b.getChildCount());
                        break;

                    case 3:
                        d.setStartBefore(b);
                        break;

                    case 4:
                        d.setStartAfter(b);
                }
                a(d);
            },
            setEndAt: function (b, c) {
                var d = this;
                switch (c) {
                    case 1:
                        d.setEnd(b, 0);
                        break;

                    case 2:
                        if (3 == b.type) d.setEnd(b, b.getLength()); else d.setEnd(b, b.getChildCount());
                        break;

                    case 3:
                        d.setEndBefore(b);
                        break;

                    case 4:
                        d.setEndAfter(b);
                }
                a(d);
            },
            fixBlock: function (a, b) {
                var d = this;
                var e = d.createBookmark(), f = d.document.createElement(b);
                d.collapse(a);
                d.enlarge(2);
                d.extractContents().appendTo(f);
                f.trim();
                if (!c) f.appendBogus();
                d.insertNode(f);
                d.moveToBookmark(e);
                return f;
            },
            splitBlock: function (a) {
                var b = this;
                var e = new d.elementPath(b.startContainer), f = new d.elementPath(b.endContainer), g = e.blockLimit, h = f.blockLimit, i = e.block, j = f.block, k = null;
                if (!g.equals(h)) return null;
                if ("br" != a) {
                    if (!i) {
                        i = b.fixBlock(true, a);
                        j = new d.elementPath(b.endContainer).block;
                    }
                    if (!j) j = b.fixBlock(false, a);
                }
                var l = i && b.checkStartOfBlock(), m = j && b.checkEndOfBlock();
                b.deleteContents();
                if (i && i.equals(j)) if (m) {
                    k = new d.elementPath(b.startContainer);
                    b.moveToPosition(j, 4);
                    j = null;
                } else if (l) {
                    k = new d.elementPath(b.startContainer);
                    b.moveToPosition(i, 3);
                    i = null;
                } else {
                    j = b.splitElement(i);
                    if (!c && !i.is("ul", "ol")) i.appendBogus();
                }
                return {
                    previousBlock: i,
                    nextBlock: j,
                    wasStartOfBlock: l,
                    wasEndOfBlock: m,
                    elementPath: k
                };
            },
            splitElement: function (a) {
                var b = this;
                if (!b.collapsed) return null;
                b.setEndAt(a, 2);
                var c = b.extractContents(), d = a.clone(false);
                c.appendTo(d);
                d.insertAfter(a);
                b.moveToPosition(a, 4);
                return d;
            },
            checkBoundaryOfElement: function (a, b) {
                var c = 1 == b, e = this.clone();
                e.collapse(c);
                e[c ? "setStartAt" : "setEndAt"](a, c ? 1 : 2);
                var f = new d.walker(e);
                f.evaluator = k(c);
                return f[c ? "checkBackward" : "checkForward"]();
            },
            checkStartOfBlock: function () {
                var a = this;
                var b = a.startContainer, f = a.startOffset;
                if (c && f && 3 == b.type) {
                    var g = e.ltrim(b.substring(0, f));
                    if (n.test(g)) a.trim(0, 1);
                }
                var h = new d.elementPath(a.startContainer), j = a.clone();
                j.collapse(true);
                j.setStartAt(h.block || h.blockLimit, 1);
                var k = new d.walker(j);
                k.evaluator = i();
                return k.checkBackward();
            },
            checkEndOfBlock: function () {
                var a = this;
                var b = a.endContainer, f = a.endOffset;
                if (c && 3 == b.type) {
                    var g = e.rtrim(b.substring(f));
                    if (n.test(g)) a.trim(1, 0);
                }
                var h = new d.elementPath(a.endContainer), j = a.clone();
                j.collapse(false);
                j.setEndAt(h.block || h.blockLimit, 2);
                var k = new d.walker(j);
                k.evaluator = i();
                return k.checkForward();
            },
            getPreviousNode: function (a, b, c) {
                var e = this.clone();
                e.collapse(1);
                e.setStartAt(c || this.document.getBody(), 1);
                var f = new d.walker(e);
                f.evaluator = a;
                f.guard = b;
                return f.previous();
            },
            getNextNode: function (a, b, c) {
                var e = this.clone();
                e.collapse();
                e.setEndAt(c || this.document.getBody(), 2);
                var f = new d.walker(e);
                f.evaluator = a;
                f.guard = b;
                return f.next();
            },
            checkReadOnly: function () {
                function a(a, b) {
                    while (a) {
                        if (1 == a.type) if ("false" == a.getAttribute("contentEditable") && !a.data("cke-editable")) return 0; else if (a.is("html") || "true" == a.getAttribute("contentEditable") && (a.contains(b) || a.equals(b))) break;
                        a = a.getParent();
                    }
                    return 1;
                }
                return function () {
                    var b = this.startContainer, c = this.endContainer;
                    return !(a(b, c) && a(c, b));
                };
            }(),
            moveToElementEditablePosition: function (a, b) {
                function c(a, c) {
                    var d;
                    if (1 == a.type && a.isEditable(false)) d = a[b ? "getLast" : "getFirst"](o);
                    if (!c && !d) d = a[b ? "getPrevious" : "getNext"](o);
                    return d;
                }
                if (1 == a.type && !a.isEditable(false)) {
                    this.moveToPosition(a, b ? 4 : 3);
                    return true;
                }
                var d = 0;
                while (a) {
                    if (3 == a.type) {
                        if (b && this.checkEndOfBlock() && n.test(a.getText())) this.moveToPosition(a, 3); else this.moveToPosition(a, b ? 4 : 3);
                        d = 1;
                        break;
                    }
                    if (1 == a.type) if (a.isEditable()) {
                        this.moveToPosition(a, b ? 2 : 1);
                        d = 1;
                    } else if (b && a.is("br") && this.checkEndOfBlock()) this.moveToPosition(a, 3);
                    a = c(a, d);
                }
                return !!d;
            },
            moveToElementEditStart: function (a) {
                return this.moveToElementEditablePosition(a);
            },
            moveToElementEditEnd: function (a) {
                return this.moveToElementEditablePosition(a, true);
            },
            getEnclosedNode: function () {
                var a = this.clone();
                a.optimize();
                if (1 != a.startContainer.type || 1 != a.endContainer.type) return null;
                var b = new d.walker(a), c = d.walker.bookmark(true), e = d.walker.whitespaces(true), f = function (a) {
                    return e(a) && c(a);
                };
                a.evaluator = f;
                var g = b.next();
                b.reset();
                return g && g.equals(b.previous()) ? g : null;
            },
            getTouchedStartNode: function () {
                var a = this.startContainer;
                if (this.collapsed || 1 != a.type) return a;
                return a.getChild(this.startOffset) || a;
            },
            getTouchedEndNode: function () {
                var a = this.endContainer;
                if (this.collapsed || 1 != a.type) return a;
                return a.getChild(this.endOffset - 1) || a;
            }
        };
    }();
    a.POSITION_AFTER_START = 1;
    a.POSITION_BEFORE_END = 2;
    a.POSITION_BEFORE_START = 3;
    a.POSITION_AFTER_END = 4;
    a.ENLARGE_ELEMENT = 1;
    a.ENLARGE_BLOCK_CONTENTS = 2;
    a.ENLARGE_LIST_ITEM_CONTENTS = 3;
    a.START = 1;
    a.END = 2;
    a.STARTEND = 3;
    a.SHRINK_ELEMENT = 1;
    a.SHRINK_TEXT = 2;
    !function () {
        d.rangeList = function (b) {
            if (b instanceof d.rangeList) return b;
            if (!b) b = []; else if (b instanceof d.range) b = [b];
            return e.extend(b, a);
        };
        var a = {
            createIterator: function () {
                var a = this, b = d.walker.bookmark(), c = function (a) {
                    return !(a.is && a.is("tr"));
                }, e = [], f;
                return {
                    getNextRange: function (c) {
                        f = void 0 == f ? 0 : f + 1;
                        var d = a[f];
                        if (d && a.length > 1) {
                            if (!f) for (var g = a.length - 1; g >= 0; g--) e.unshift(a[g].createBookmark(true));
                            if (c) {
                                var h = 0;
                                while (a[f + h + 1]) {
                                    var i = d.document, j = 0, k = i.getById(e[h].endNode), l = i.getById(e[h + 1].startNode), m;
                                    while (1) {
                                        m = k.getNextSourceNode(false);
                                        if (!l.equals(m)) {
                                            if (b(m) || 1 == m.type && m.isBlockBoundary()) {
                                                k = m;
                                                continue;
                                            }
                                        } else j = 1;
                                        break;
                                    }
                                    if (!j) break;
                                    h++;
                                }
                            }
                            d.moveToBookmark(e.shift());
                            while (h--) {
                                m = a[++f];
                                m.moveToBookmark(e.shift());
                                d.setEnd(m.endContainer, m.endOffset);
                            }
                        }
                        return d;
                    }
                };
            },
            createBookmarks: function (a) {
                var c = this;
                var d = [], e;
                for (var f = 0; f < c.length; f++) {
                    d.push(e = c[f].createBookmark(a, true));
                    for (var g = f + 1; g < c.length; g++) {
                        c[g] = b(e, c[g]);
                        c[g] = b(e, c[g], true);
                    }
                }
                return d;
            },
            createBookmarks2: function (a) {
                var b = [];
                for (var c = 0; c < this.length; c++) b.push(this[c].createBookmark2(a));
                return b;
            },
            moveToBookmarks: function (a) {
                for (var b = 0; b < this.length; b++) this[b].moveToBookmark(a[b]);
            }
        };
        function b(a, b, c) {
            var d = a.serializable, e = b[c ? "endContainer" : "startContainer"], f = c ? "endOffset" : "startOffset", g = d ? b.document.getById(a.startNode) : a.startNode, h = d ? b.document.getById(a.endNode) : a.endNode;
            if (e.equals(g.getPrevious())) {
                b.startOffset = b.startOffset - e.getLength() - h.getPrevious().getLength();
                e = h.getNext();
            } else if (e.equals(h.getPrevious())) {
                b.startOffset = b.startOffset - e.getLength();
                e = h.getNext();
            }
            e.equals(g.getParent()) && b[f]++;
            e.equals(h.getParent()) && b[f]++;
            b[c ? "endContainer" : "startContainer"] = e;
            return b;
        }
    }();
    !function () {
        if (b.webkit) {
            b.hc = false;
            return;
        }
        var c = h.createFromHtml('<div style="width:0px;height:0px;position:absolute;left:-10000px;border: 1px solid;border-color: red blue;"></div>', a.document);
        c.appendTo(a.document.getHead());
        try {
            b.hc = c.getComputedStyle("border-top-color") == c.getComputedStyle("border-right-color");
        } catch (d) {
            b.hc = false;
        }
        if (b.hc) b.cssClass += " cke_hc";
        c.remove();
    }();
    j.load(i.corePlugins.split(","), function () {
        a.status = "loaded";
        a.fire("loaded");
        var b = a._.pending;
        if (b) {
            delete a._.pending;
            for (var c = 0; c < b.length; c++) a.add(b[c]);
        }
    });
    if (c) try {
        document.execCommand("BackgroundImageCache", false, true);
    } catch (l) { }
    a.skins.add("kama", function () {
        var d = "cke_ui_color";
        return {
            editor: {
                css: ["editor.css"]
            },
            dialog: {
                css: ["dialog.css"]
            },
            richcombo: {
                canGroup: false
            },
            templates: {
                css: ["templates.css"]
            },
            margins: [0, 0, 0, 0],
            init: function (f) {
                if (f.config.width && !isNaN(f.config.width)) f.config.width -= 12;
                var g = [], h = /\$color/g, i = "/* UI Color Support */.cke_skin_kama .cke_menuitem .cke_icon_wrapper{	background-color: $color !important;	border-color: $color !important;}.cke_skin_kama .cke_menuitem a:hover .cke_icon_wrapper,.cke_skin_kama .cke_menuitem a:focus .cke_icon_wrapper,.cke_skin_kama .cke_menuitem a:active .cke_icon_wrapper{	background-color: $color !important;	border-color: $color !important;}.cke_skin_kama .cke_menuitem a:hover .cke_label,.cke_skin_kama .cke_menuitem a:focus .cke_label,.cke_skin_kama .cke_menuitem a:active .cke_label{	background-color: $color !important;}.cke_skin_kama .cke_menuitem a.cke_disabled:hover .cke_label,.cke_skin_kama .cke_menuitem a.cke_disabled:focus .cke_label,.cke_skin_kama .cke_menuitem a.cke_disabled:active .cke_label{	background-color: transparent !important;}.cke_skin_kama .cke_menuitem a.cke_disabled:hover .cke_icon_wrapper,.cke_skin_kama .cke_menuitem a.cke_disabled:focus .cke_icon_wrapper,.cke_skin_kama .cke_menuitem a.cke_disabled:active .cke_icon_wrapper{	background-color: $color !important;	border-color: $color !important;}.cke_skin_kama .cke_menuitem a.cke_disabled .cke_icon_wrapper{	background-color: $color !important;	border-color: $color !important;}.cke_skin_kama .cke_menuseparator{	background-color: $color !important;}.cke_skin_kama .cke_menuitem a:hover,.cke_skin_kama .cke_menuitem a:focus,.cke_skin_kama .cke_menuitem a:active{	background-color: $color !important;}";
                if (b.webkit) {
                    i = i.split("}").slice(0, -1);
                    for (var j = 0; j < i.length; j++) i[j] = i[j].split("{");
                }
                function k(a) {
                    var b = a.getById(d);
                    if (!b) {
                        b = a.getHead().append("style");
                        b.setAttribute("id", d);
                        b.setAttribute("type", "text/css");
                    }
                    return b;
                }
                function l(a, d, e) {
                    var f, g, h;
                    for (var i = 0; i < a.length; i++) if (b.webkit) for (g = 0; g < d.length; g++) {
                        h = d[g][1];
                        for (f = 0; f < e.length; f++) h = h.replace(e[f][0], e[f][1]);
                        a[i].$.sheet.addRule(d[g][0], h);
                    } else {
                        h = d;
                        for (f = 0; f < e.length; f++) h = h.replace(e[f][0], e[f][1]);
                        if (c) a[i].$.styleSheet.cssText += h; else a[i].$.innerHTML += h;
                    }
                }
                var m = /\$color/g;
                e.extend(f, {
                    uiColor: null,
                    getUiColor: function () {
                        return this.uiColor;
                    },
                    setUiColor: function (c) {
                        var d, e = k(a.document), h = "." + f.id, j = [h + " .cke_wrapper", h + "_dialog .cke_dialog_contents", h + "_dialog a.cke_dialog_tab", h + "_dialog .cke_dialog_footer"].join(","), n = "background-color: $color !important;";
                        if (b.webkit) d = [[j, n]]; else d = j + "{" + n + "}";
                        return (this.setUiColor = function (a) {
                            var b = [[m, a]];
                            f.uiColor = a;
                            l([e], d, b);
                            l(g, i, b);
                        })(c);
                    }
                });
                f.on("menuShow", function (a) {
                    var b = a.data[0], c = b.element.getElementsByTag("iframe").getItem(0).getFrameDocument();
                    if (!c.getById("cke_ui_color")) {
                        var d = k(c);
                        g.push(d);
                        var e = f.getUiColor();
                        if (e) l([d], i, [[m, e]]);
                    }
                });
                if (f.config.uiColor) f.setUiColor(f.config.uiColor);
            }
        };
    }());
    !function () {
        a.dialog ? b() : a.on("dialogPluginReady", b);
        function b() {
            a.dialog.on("resize", function (a) {
                var b = a.data, c = b.width, d = b.height, e = b.dialog, f = e.parts.contents;
                if ("kama" != b.skin) return;
                f.setStyles({
                    width: c + "px",
                    height: d + "px"
                });
            });
        }
    }();
    j.add("about", {
        requires: ["dialog"],
        init: function (b) {
            var c = b.addCommand("about", new a.dialogCommand("about"));
            c.modes = {
                wysiwyg: 1,
                source: 1
            };
            c.canUndo = false;
            c.readOnly = 1;
            b.ui.addButton("About", {
                label: b.lang.about.title,
                command: "about"
            });
            a.dialog.add("about", this.path + "dialogs/about.js");
        }
    });
    !function () {
        var b = "a11yhelp", c = "a11yHelp";
        j.add(b, {
            requires: ["dialog"],
            availableLangs: {
                cs: 1,
                cy: 1,
                da: 1,
                de: 1,
                el: 1,
                en: 1,
                eo: 1,
                fa: 1,
                fi: 1,
                fr: 1,
                gu: 1,
                he: 1,
                it: 1,
                ku: 1,
                mk: 1,
                nb: 1,
                nl: 1,
                no: 1,
                "pt-br": 1,
                ro: 1,
                tr: 1,
                ug: 1,
                vi: 1,
                "zh-cn": 1
            },
            init: function (b) {
                var d = this;
                b.addCommand(c, {
                    exec: function () {
                        var f = b.langCode;
                        f = d.availableLangs[f] ? f : "en";
                        a.scriptLoader.load(a.getUrl(d.path + "lang/" + f + ".js"), function () {
                            e.extend(b.lang, d.langEntries[f]);
                            b.openDialog(c);
                        });
                    },
                    modes: {
                        wysiwyg: 1,
                        source: 1
                    },
                    readOnly: 1,
                    canUndo: false
                });
                a.dialog.add(c, this.path + "dialogs/a11yhelp.js");
            }
        });
    }();
    j.add("basicstyles", {
        requires: ["styles", "button"],
        init: function (b) {
            var c = function (c, d, e, f) {
                var g = new a.style(f);
                b.attachStyleStateChange(g, function (a) {
                    !b.readOnly && b.getCommand(e).setState(a);
                });
                b.addCommand(e, new a.styleCommand(g));
                b.ui.addButton(c, {
                    label: d,
                    command: e
                });
            }, d = b.config, e = b.lang;
            c("Bold", e.bold, "bold", d.coreStyles_bold);
            c("Italic", e.italic, "italic", d.coreStyles_italic);
            c("Underline", e.underline, "underline", d.coreStyles_underline);
            c("Strike", e.strike, "strike", d.coreStyles_strike);
            c("Subscript", e.subscript, "subscript", d.coreStyles_subscript);
            c("Superscript", e.superscript, "superscript", d.coreStyles_superscript);
        }
    });
    i.coreStyles_bold = {
        element: "strong",
        overrides: "b"
    };
    i.coreStyles_italic = {
        element: "em",
        overrides: "i"
    };
    i.coreStyles_underline = {
        element: "u"
    };
    i.coreStyles_strike = {
        element: "strike"
    };
    i.coreStyles_subscript = {
        element: "sub"
    };
    i.coreStyles_superscript = {
        element: "sup"
    };
    !function () {
        var b = {
            table: 1,
            ul: 1,
            ol: 1,
            blockquote: 1,
            div: 1
        }, c = {}, f = {};
        e.extend(c, b, {
            tr: 1,
            p: 1,
            div: 1,
            li: 1
        });
        e.extend(f, c, {
            td: 1
        });
        function g(a) {
            i(a);
            k(a);
        }
        function i(a) {
            var b = a.editor, c = a.data.path;
            if (b.readOnly) return;
            var d = b.config.useComputedState, e;
            d = void 0 === d || d;
            if (!d) e = l(c.lastElement);
            e = e || c.block || c.blockLimit;
            if (e.is("body")) {
                var f = b.getSelection().getRanges()[0].getEnclosedNode();
                f && 1 == f.type && (e = f);
            }
            if (!e) return;
            var g = d ? e.getComputedStyle("direction") : e.getStyle("direction") || e.getAttribute("dir");
            b.getCommand("bidirtl").setState("rtl" == g ? 1 : 2);
            b.getCommand("bidiltr").setState("ltr" == g ? 1 : 2);
        }
        function k(a) {
            var b = a.editor, c = a.data.path.block || a.data.path.blockLimit;
            b.fire("contentDirChanged", c ? c.getComputedStyle("direction") : b.lang.dir);
        }
        function l(a) {
            while (a && !(a.getName() in f || a.is("body"))) {
                var b = a.getParent();
                if (!b) break;
                a = b;
            }
            return a;
        }
        function m(a, b, c, d) {
            if (a.isReadOnly()) return;
            h.setMarker(d, a, "bidi_processed", 1);
            var e = a;
            while ((e = e.getParent()) && !e.is("body")) if (e.getCustomData("bidi_processed")) {
                a.removeStyle("direction");
                a.removeAttribute("dir");
                return;
            }
            var f = "useComputedState" in c.config ? c.config.useComputedState : 1, g = f ? a.getComputedStyle("direction") : a.getStyle("direction") || a.hasAttribute("dir");
            if (g == b) return;
            a.removeStyle("direction");
            if (f) {
                a.removeAttribute("dir");
                if (b != a.getComputedStyle("direction")) a.setAttribute("dir", b);
            } else a.setAttribute("dir", b);
            c.forceNextSelectionCheck();
        }
        function n(a, b, c) {
            var d = a.getCommonAncestor(false, true);
            a = a.clone();
            a.enlarge(2 == c ? 3 : 2);
            if (a.checkBoundaryOfElement(d, 1) && a.checkBoundaryOfElement(d, 2)) {
                var e;
                while (d && 1 == d.type && (e = d.getParent()) && 1 == e.getChildCount() && !(d.getName() in b)) d = e;
                return 1 == d.type && d.getName() in b && d;
            }
        }
        function o(a) {
            return function (e) {
                var f = e.getSelection(), g = e.config.enterMode, i = f.getRanges();
                if (i && i.length) {
                    var j = {}, k = f.createBookmarks(), l = i.createIterator(), o, p = 0;
                    while (o = l.getNextRange(1)) {
                        var q = o.getEnclosedNode();
                        if (!q || q && !(1 == q.type && q.getName() in c)) q = n(o, b, g);
                        q && m(q, a, e, j);
                        var r, s, t = new d.walker(o), u = k[p].startNode, v = k[p++].endNode;
                        t.evaluator = function (a) {
                            return !!(1 == a.type && a.getName() in b && !(a.getName() == (1 == g ? "p" : "div") && 1 == a.getParent().type && "blockquote" == a.getParent().getName()) && 2 & a.getPosition(u) && 4 == (a.getPosition(v) & 4 + 16));
                        };
                        while (s = t.next()) m(s, a, e, j);
                        r = o.createIterator();
                        r.enlargeBr = 2 != g;
                        while (s = r.getNextParagraph(1 == g ? "p" : "div")) m(s, a, e, j);
                    }
                    h.clearAllMarkers(j);
                    e.forceNextSelectionCheck();
                    f.selectBookmarks(k);
                    e.focus();
                }
            };
        }
        j.add("bidi", {
            requires: ["styles", "button"],
            init: function (b) {
                var c = function (c, d, e, f) {
                    b.addCommand(e, new a.command(b, {
                        exec: f
                    }));
                    b.ui.addButton(c, {
                        label: d,
                        command: e
                    });
                }, d = b.lang.bidi;
                c("BidiLtr", d.ltr, "bidiltr", o("ltr"));
                c("BidiRtl", d.rtl, "bidirtl", o("rtl"));
                b.on("selectionChange", g);
                b.on("contentDom", function () {
                    b.document.on("dirChanged", function (a) {
                        b.fire("dirChanged", {
                            node: a.data,
                            dir: a.data.getDirection(1)
                        });
                    });
                });
            }
        });
        function p(a) {
            var b = a.getDocument().getBody().getParent();
            while (a) {
                if (a.equals(b)) return false;
                a = a.getParent();
            }
            return true;
        }
        function q(b) {
            var c = b == r.setAttribute, d = b == r.removeAttribute, e = /\bdirection\s*:\s*(.*?)\s*(:?$|;)/;
            return function (f, g) {
                var h = this;
                if (!h.getDocument().equals(a.document)) {
                    var i;
                    if ((f == (c || d ? "dir" : "direction") || "style" == f && (d || e.test(g))) && !p(h)) {
                        i = h.getDirection(1);
                        var j = b.apply(h, arguments);
                        if (i != h.getDirection(1)) {
                            h.getDocument().fire("dirChanged", h);
                            return j;
                        }
                    }
                }
                return b.apply(h, arguments);
            };
        }
        var r = h.prototype, s = ["setStyle", "removeStyle", "setAttribute", "removeAttribute"];
        for (var t = 0; t < s.length; t++) r[s[t]] = e.override(r[s[t]], q);
    }();
    !function () {
        function a(a, b) {
            var c = b.block || b.blockLimit;
            if (!c || "body" == c.getName()) return 2;
            if (c.getAscendant("blockquote", true)) return 1;
            return 2;
        }
        function b(b) {
            var c = b.editor;
            if (c.readOnly) return;
            var d = c.getCommand("blockquote");
            d.state = a(c, b.data.path);
            d.fire("state");
        }
        function e(a) {
            for (var b = 0, c = a.getChildCount(), d; b < c && (d = a.getChild(b)); b++) if (1 == d.type && d.isBlockBoundary()) return false;
            return true;
        }
        var f = {
            exec: function (a) {
                var b = a.getCommand("blockquote").state, f = a.getSelection(), g = f && f.getRanges(true)[0];
                if (!g) return;
                var i = f.createBookmarks();
                if (c) {
                    var j = i[0].startNode, k = i[0].endNode, l;
                    if (j && "blockquote" == j.getParent().getName()) {
                        l = j;
                        while (l = l.getNext()) if (1 == l.type && l.isBlockBoundary()) {
                            j.move(l, true);
                            break;
                        }
                    }
                    if (k && "blockquote" == k.getParent().getName()) {
                        l = k;
                        while (l = l.getPrevious()) if (1 == l.type && l.isBlockBoundary()) {
                            k.move(l);
                            break;
                        }
                    }
                }
                var m = g.createIterator(), n;
                m.enlargeBr = 2 != a.config.enterMode;
                if (2 == b) {
                    var o = [];
                    while (n = m.getNextParagraph()) o.push(n);
                    if (o.length < 1) {
                        var p = a.document.createElement(1 == a.config.enterMode ? "p" : "div"), q = i.shift();
                        g.insertNode(p);
                        p.append(new d.text("﻿", a.document));
                        g.moveToBookmark(q);
                        g.selectNodeContents(p);
                        g.collapse(true);
                        q = g.createBookmark();
                        o.push(p);
                        i.unshift(q);
                    }
                    var r = o[0].getParent(), s = [];
                    for (var t = 0; t < o.length; t++) {
                        n = o[t];
                        r = r.getCommonAncestor(n.getParent());
                    }
                    var u = {
                        table: 1,
                        tbody: 1,
                        tr: 1,
                        ol: 1,
                        ul: 1
                    };
                    while (u[r.getName()]) r = r.getParent();
                    var v = null;
                    while (o.length > 0) {
                        n = o.shift();
                        while (!n.getParent().equals(r)) n = n.getParent();
                        if (!n.equals(v)) s.push(n);
                        v = n;
                    }
                    while (s.length > 0) {
                        n = s.shift();
                        if ("blockquote" == n.getName()) {
                            var w = new d.documentFragment(a.document);
                            while (n.getFirst()) {
                                w.append(n.getFirst().remove());
                                o.push(w.getLast());
                            }
                            w.replace(n);
                        } else o.push(n);
                    }
                    var x = a.document.createElement("blockquote");
                    x.insertBefore(o[0]);
                    while (o.length > 0) {
                        n = o.shift();
                        x.append(n);
                    }
                } else if (1 == b) {
                    var y = [], z = {};
                    while (n = m.getNextParagraph()) {
                        var A = null, B = null;
                        while (n.getParent()) {
                            if ("blockquote" == n.getParent().getName()) {
                                A = n.getParent();
                                B = n;
                                break;
                            }
                            n = n.getParent();
                        }
                        if (A && B && !B.getCustomData("blockquote_moveout")) {
                            y.push(B);
                            h.setMarker(z, B, "blockquote_moveout", true);
                        }
                    }
                    h.clearAllMarkers(z);
                    var C = [], D = [];
                    z = {};
                    while (y.length > 0) {
                        var E = y.shift();
                        x = E.getParent();
                        if (!E.getPrevious()) E.remove().insertBefore(x); else if (!E.getNext()) E.remove().insertAfter(x); else {
                            E.breakParent(E.getParent());
                            D.push(E.getNext());
                        }
                        if (!x.getCustomData("blockquote_processed")) {
                            D.push(x);
                            h.setMarker(z, x, "blockquote_processed", true);
                        }
                        C.push(E);
                    }
                    h.clearAllMarkers(z);
                    for (t = D.length - 1; t >= 0; t--) {
                        x = D[t];
                        if (e(x)) x.remove();
                    }
                    if (2 == a.config.enterMode) {
                        var F = true;
                        while (C.length) {
                            E = C.shift();
                            if ("div" == E.getName()) {
                                w = new d.documentFragment(a.document);
                                var G = F && E.getPrevious() && !(1 == E.getPrevious().type && E.getPrevious().isBlockBoundary());
                                if (G) w.append(a.document.createElement("br"));
                                var H = E.getNext() && !(1 == E.getNext().type && E.getNext().isBlockBoundary());
                                while (E.getFirst()) E.getFirst().remove().appendTo(w);
                                if (H) w.append(a.document.createElement("br"));
                                w.replace(E);
                                F = false;
                            }
                        }
                    }
                }
                f.selectBookmarks(i);
                a.focus();
            }
        };
        j.add("blockquote", {
            init: function (a) {
                a.addCommand("blockquote", f);
                a.ui.addButton("Blockquote", {
                    label: a.lang.blockquote,
                    command: "blockquote"
                });
                a.on("selectionChange", b);
            },
            requires: ["domiterator"]
        });
    }();
    j.add("button", {
        beforeInit: function (a) {
            a.ui.addHandler("button", k.button.handler);
        }
    });
    a.UI_BUTTON = "button";
    k.button = function (a) {
        e.extend(this, a, {
            title: a.label,
            className: a.className || a.command && "cke_button_" + a.command || "",
            click: a.click || function (b) {
                b.execCommand(a.command);
            }
        });
        this._ = {};
    };
    k.button.handler = {
        create: function (a) {
            return new k.button(a);
        }
    };
    !function () {
        k.button.prototype = {
            render: function (f, g) {
                var h = b, i = this._.id = e.getNextId(), j = "", k = this.command, l;
                this._.editor = f;
                var m = {
                    id: i,
                    button: this,
                    editor: f,
                    focus: function () {
                        var b = a.document.getById(i);
                        b.focus();
                    },
                    execute: function () {
                        if (c && b.version < 7) e.setTimeout(function () {
                            this.button.click(f);
                        }, 0, this); else this.button.click(f);
                    }
                }, n = e.addFunction(function (a) {
                    if (m.onkey) {
                        a = new d.event(a);
                        return false !== m.onkey(m, a.getKeystroke());
                    }
                }), o = e.addFunction(function (a) {
                    var c;
                    if (m.onfocus) c = false !== m.onfocus(m, new d.event(a));
                    if (b.gecko && b.version < 10900) a.preventBubble();
                    return c;
                });
                m.clickFn = l = e.addFunction(m.execute, m);
                if (this.modes) {
                    var p = {};
                    function q() {
                        var a = f.mode;
                        if (a) {
                            var b = this.modes[a] ? void 0 != p[a] ? p[a] : 2 : 0;
                            this.setState(f.readOnly && !this.readOnly ? 0 : b);
                        }
                    }
                    f.on("beforeModeUnload", function () {
                        if (f.mode && 0 != this._.state) p[f.mode] = this._.state;
                    }, this);
                    f.on("mode", q, this);
                    !this.readOnly && f.on("readOnly", q, this);
                } else if (k) {
                    k = f.getCommand(k);
                    if (k) {
                        k.on("state", function () {
                            this.setState(k.state);
                        }, this);
                        j += "cke_" + (1 == k.state ? "on" : 0 == k.state ? "disabled" : "off");
                    }
                }
                if (!k) j += "cke_off";
                if (this.className) j += " " + this.className;
                g.push('<span class="cke_button' + (this.icon && this.icon.indexOf(".png") == -1 ? " cke_noalphafix" : "") + '">', '<a id="', i, '" class="', j, '"', h.gecko && h.version >= 10900 && !h.hc ? "" : '" href="javascript:void(\'' + (this.title || "").replace("'", "") + "')\"", ' title="', this.title, '" tabindex="-1" hidefocus="true" role="button" aria-labelledby="' + i + '_label"' + (this.hasArrow ? ' aria-haspopup="true"' : ""));
                if (h.opera || h.gecko && h.mac) g.push(' onkeypress="return false;"');
                if (h.gecko) g.push(' onblur="this.style.cssText = this.style.cssText;"');
                g.push(' onkeydown="return CKEDITOR.tools.callFunction(', n, ', event);" onfocus="return CKEDITOR.tools.callFunction(', o, ', event);" ' + (c ? 'onclick="return false;" onmouseup' : "onclick") + '="CKEDITOR.tools.callFunction(', l, ', this); return false;"><span class="cke_icon"');
                if (this.icon) {
                    var r = (this.iconOffset || 0) * -16;
                    g.push(' style="background-image:url(', a.getUrl(this.icon), ");background-position:0 " + r + 'px;"');
                }
                g.push('>&nbsp;</span><span id="', i, '_label" class="cke_label">', this.label, "</span>");
                if (this.hasArrow) g.push('<span class="cke_buttonarrow">' + (b.hc ? "&#9660;" : "&nbsp;") + "</span>");
                g.push("</a>", "</span>");
                if (this.onRender) this.onRender();
                return m;
            },
            setState: function (b) {
                if (this._.state == b) return false;
                this._.state = b;
                var c = a.document.getById(this._.id);
                if (c) {
                    c.setState(b);
                    0 == b ? c.setAttribute("aria-disabled", true) : c.removeAttribute("aria-disabled");
                    1 == b ? c.setAttribute("aria-pressed", true) : c.removeAttribute("aria-pressed");
                    return true;
                } else return false;
            }
        };
    }();
    k.prototype.addButton = function (a, b) {
        this.add(a, "button", b);
    };
    !function () {
        var f = function (a, c) {
            var d = a.document, e = d.getBody(), f = false, g = function () {
                f = true;
            };
            e.on(c, g);
            (b.version > 7 ? d.$ : d.$.selection.createRange()).execCommand(c);
            e.removeListener(c, g);
            return f;
        }, g = c ? function (a, b) {
            return f(a, b);
        } : function (a, b) {
            try {
                return a.document.$.execCommand(b, false, null);
            } catch (c) {
                return false;
            }
        }, i = function (a) {
            var b = this;
            b.type = a;
            b.canUndo = "cut" == b.type;
            b.startDisabled = true;
        };
        i.prototype = {
            exec: function (a, b) {
                "cut" == this.type && o(a);
                var c = g(a, this.type);
                if (!c) alert(a.lang.clipboard[this.type + "Error"]);
                return c;
            }
        };
        var k = {
            canUndo: false,
            exec: c ? function (a) {
                a.focus();
                if (!a.document.getBody().fire("beforepaste") && !f(a, "paste")) {
                    a.fire("pasteDialog");
                    return false;
                }
            } : function (a) {
                try {
                    if (!a.document.getBody().fire("beforepaste") && !a.document.$.execCommand("Paste", false, null)) throw 0;
                } catch (b) {
                    setTimeout(function () {
                        a.fire("pasteDialog");
                    }, 0);
                    return false;
                }
            }
        }, l = function (a) {
            if ("wysiwyg" != this.mode) return;
            switch (a.data.keyCode) {
                case 1114112 + 86:
                case 2228224 + 45:
                    var c = this.document.getBody();
                    if (b.opera || b.gecko) c.fire("paste");
                    return;

                case 1114112 + 88:
                case 2228224 + 46:
                    var d = this;
                    this.fire("saveSnapshot");
                    setTimeout(function () {
                        d.fire("saveSnapshot");
                    }, 0);
            }
        };
        function m(a) {
            a.cancel();
        }
        function n(a, c, e) {
            var f = this.document;
            if (f.getById("cke_pastebin")) return;
            if ("text" == c && a.data && a.data.$.clipboardData) {
                var g = a.data.$.clipboardData.getData("text/plain");
                if (g) {
                    a.data.preventDefault();
                    e(g);
                    return;
                }
            }
            var i = this.getSelection(), j = new d.range(f), k = new h("text" == c ? "textarea" : b.webkit ? "body" : "div", f);
            k.setAttribute("id", "cke_pastebin");
            b.webkit && k.append(f.createText(" "));
            f.getBody().append(k);
            k.setStyles({
                position: "absolute",
                top: i.getStartElement().getDocumentPosition().y + "px",
                width: "1px",
                height: "1px",
                overflow: "hidden"
            });
            k.setStyle("ltr" == this.config.contentsLangDirection ? "left" : "right", "-1000px");
            var l = i.createBookmarks();
            this.on("selectionChange", m, null, null, 0);
            if ("text" == c) k.$.focus(); else {
                j.setStartAt(k, 1);
                j.setEndAt(k, 2);
                j.select(true);
            }
            var n = this;
            window.setTimeout(function () {
                n.document.getBody().focus();
                n.removeListener("selectionChange", m);
                if (b.ie7Compat) {
                    i.selectBookmarks(l);
                    k.remove();
                } else {
                    k.remove();
                    i.selectBookmarks(l);
                }
                var a;
                k = b.webkit && (a = k.getFirst()) && a.is && a.hasClass("Apple-style-span") ? a : k;
                e(k["get" + ("text" == c ? "Value" : "Html")]());
            }, 0);
        }
        function o(a) {
            if (!c || b.quirks) return;
            var d = a.getSelection(), e;
            if (3 == d.getType() && (e = d.getSelectedElement())) {
                var f = d.getRanges()[0], g = a.document.createText("");
                g.insertBefore(e);
                f.setStartBefore(g);
                f.setEndAfter(e);
                d.selectRanges([f]);
                setTimeout(function () {
                    if (e.getParent()) {
                        g.remove();
                        d.selectElement(e);
                    }
                }, 0);
            }
        }
        var p, q;
        function r(a, d) {
            var e;
            if (q && a in {
                Paste: 1,
                Cut: 1
            }) return 0;
            if ("Paste" == a) {
                c && (p = 1);
                try {
                    e = d.document.$.queryCommandEnabled(a) || b.webkit;
                } catch (f) { }
                p = 0;
            } else {
                var g = d.getSelection(), h = g && g.getRanges();
                e = g && !(1 == h.length && h[0].collapsed);
            }
            return e ? 2 : 0;
        }
        function s() {
            var a = this;
            if ("wysiwyg" != a.mode) return;
            var b = r("Paste", a);
            a.getCommand("cut").setState(r("Cut", a));
            a.getCommand("copy").setState(r("Copy", a));
            a.getCommand("paste").setState(b);
            a.fire("pasteState", b);
        }
        j.add("clipboard", {
            requires: ["dialog", "htmldataprocessor"],
            init: function (b) {
                b.on("paste", function (a) {
                    var c = a.data;
                    if (c.html) b.insertHtml(c.html); else if (c.text) b.insertText(c.text);
                    setTimeout(function () {
                        b.fire("afterPaste");
                    }, 0);
                }, null, null, 1e3);
                b.on("pasteDialog", function (a) {
                    setTimeout(function () {
                        b.openDialog("paste");
                    }, 0);
                });
                b.on("pasteState", function (a) {
                    b.getCommand("paste").setState(a.data);
                });
                function d(a, c, d, e) {
                    var f = b.lang[c];
                    b.addCommand(c, d);
                    b.ui.addButton(a, {
                        label: f,
                        command: c
                    });
                    if (b.addMenuItems) b.addMenuItem(c, {
                        label: f,
                        command: c,
                        group: "clipboard",
                        order: e
                    });
                }
                d("Cut", "cut", new i("cut"), 1);
                d("Copy", "copy", new i("copy"), 4);
                d("Paste", "paste", k, 8);
                a.dialog.add("paste", a.getUrl(this.path + "dialogs/paste.js"));
                b.on("key", l, b);
                b.on("contentDom", function () {
                    var a = b.document.getBody();
                    a.on(!c ? "paste" : "beforepaste", function (a) {
                        if (p) return;
                        var d = a.data && a.data.$;
                        if (c && d && !d.ctrlKey) return;
                        var f = {
                            mode: "html"
                        };
                        b.fire("beforePaste", f);
                        n.call(b, a, f.mode, function (a) {
                            if (!(a = e.trim(a.replace(/<span[^>]+data-cke-bookmark[^<]*?<\/span>/gi, "")))) return;
                            var c = {};
                            c[f.mode] = a;
                            b.fire("paste", c);
                        });
                    });
                    if (c) {
                        a.on("contextmenu", function () {
                            p = 1;
                            setTimeout(function () {
                                p = 0;
                            }, 0);
                        });
                        a.on("paste", function (a) {
                            if (!b.document.getById("cke_pastebin")) {
                                a.data.preventDefault();
                                p = 0;
                                k.exec(b);
                            }
                        });
                    }
                    a.on("beforecut", function () {
                        !p && o(b);
                    });
                    a.on("mouseup", function () {
                        setTimeout(function () {
                            s.call(b);
                        }, 0);
                    }, b);
                    a.on("keyup", s, b);
                });
                b.on("selectionChange", function (a) {
                    q = a.data.selection.getRanges()[0].checkReadOnly();
                    s.call(b);
                });
                if (b.contextMenu) b.contextMenu.addListener(function (a, c) {
                    var d = c.getRanges()[0].checkReadOnly();
                    return {
                        cut: r("Cut", b),
                        copy: r("Copy", b),
                        paste: r("Paste", b)
                    };
                });
            }
        });
    }();
    j.add("colorbutton", {
        requires: ["panelbutton", "floatpanel", "styles"],
        init: function (c) {
            var f = c.config, g = c.lang.colorButton, h;
            if (!b.hc) {
                i("TextColor", "fore", g.textColorTitle);
                i("BGColor", "back", g.bgColorTitle);
            }
            function i(a, b, f) {
                var h = e.getNextId() + "_colorBox";
                c.ui.add(a, "panelbutton", {
                    label: f,
                    title: f,
                    className: "cke_button_" + a.toLowerCase(),
                    modes: {
                        wysiwyg: 1
                    },
                    panel: {
                        css: c.skin.editor.css,
                        attributes: {
                            role: "listbox",
                            "aria-label": g.panelTitle
                        }
                    },
                    onBlock: function (a, d) {
                        d.autoSize = true;
                        d.element.addClass("cke_colorblock");
                        d.element.setHtml(j(a, b, h));
                        d.element.getDocument().getBody().setStyle("overflow", "hidden");
                        k.fire("ready", this);
                        var e = d.keys, f = "rtl" == c.lang.dir;
                        e[f ? 37 : 39] = "next";
                        e[40] = "next";
                        e[9] = "next";
                        e[f ? 39 : 37] = "prev";
                        e[38] = "prev";
                        e[2228224 + 9] = "prev";
                        e[32] = "click";
                    },
                    onOpen: function () {
                        var a = c.getSelection(), e = a && a.getStartElement(), f = new d.elementPath(e), g;
                        e = f.block || f.blockLimit || c.document.getBody();
                        do g = e && e.getComputedStyle("back" == b ? "background-color" : "color") || "transparent"; while ("back" == b && "transparent" == g && e && (e = e.getParent()));
                        if (!g || "transparent" == g) g = "#ffffff";
                        this._.panel._.iframe.getFrameDocument().getById(h).setStyle("background-color", g);
                    }
                });
            }
            function j(b, d, h) {
                var i = [], j = f.colorButton_colors.split(","), k = e.addFunction(function (d, e) {
                    if ("?" == d) {
                        var g = arguments.callee;
                        function h(a) {
                            this.removeListener("ok", h);
                            this.removeListener("cancel", h);
                            "ok" == a.name && g(this.getContentElement("picker", "selectedColor").getValue(), e);
                        }
                        c.openDialog("colordialog", function () {
                            this.on("ok", h);
                            this.on("cancel", h);
                        });
                        return;
                    }
                    c.focus();
                    b.hide(false);
                    c.fire("saveSnapshot");
                    new a.style(f["colorButton_" + e + "Style"], {
                        color: "inherit"
                    }).remove(c.document);
                    if (d) {
                        var i = f["colorButton_" + e + "Style"];
                        i.childRule = "back" == e ? function (a) {
                            return l(a);
                        } : function (a) {
                            return !(a.is("a") || a.getElementsByTag("a").count()) || l(a);
                        };
                        new a.style(i, {
                            color: d
                        }).apply(c.document);
                    }
                    c.fire("saveSnapshot");
                });
                i.push('<a class="cke_colorauto" _cke_focus=1 hidefocus=true title="', g.auto, '" onclick="CKEDITOR.tools.callFunction(', k, ",null,'", d, "');return false;\" href=\"javascript:void('", g.auto, '\')" role="option"><table role="presentation" cellspacing=0 cellpadding=0 width="100%"><tr><td><span class="cke_colorbox" id="', h, '"></span></td><td colspan=7 align=center>', g.auto, '</td></tr></table></a><table role="presentation" cellspacing=0 cellpadding=0 width="100%">');
                for (var m = 0; m < j.length; m++) {
                    if (m % 8 === 0) i.push("</tr><tr>");
                    var n = j[m].split("/"), o = n[0], p = n[1] || o;
                    if (!n[1]) o = "#" + o.replace(/^(.)(.)(.)$/, "$1$1$2$2$3$3");
                    var q = c.lang.colors[p] || p;
                    i.push('<td><a class="cke_colorbox" _cke_focus=1 hidefocus=true title="', q, '" onclick="CKEDITOR.tools.callFunction(', k, ",'", o, "','", d, "'); return false;\" href=\"javascript:void('", q, '\')" role="option"><span class="cke_colorbox" style="background-color:#', p, '"></span></a></td>');
                }
                if (void 0 === f.colorButton_enableMore || f.colorButton_enableMore) i.push('</tr><tr><td colspan=8 align=center><a class="cke_colormore" _cke_focus=1 hidefocus=true title="', g.more, '" onclick="CKEDITOR.tools.callFunction(', k, ",'?','", d, "');return false;\" href=\"javascript:void('", g.more, "')\"", ' role="option">', g.more, "</a></td>");
                i.push("</tr></table>");
                return i.join("");
            }
            function l(a) {
                return "false" == a.getAttribute("contentEditable") || a.getAttribute("data-nostyle");
            }
        }
    });
    i.colorButton_colors = "000,800000,8B4513,2F4F4F,008080,000080,4B0082,696969,B22222,A52A2A,DAA520,006400,40E0D0,0000CD,800080,808080,F00,FF8C00,FFD700,008000,0FF,00F,EE82EE,A9A9A9,FFA07A,FFA500,FFFF00,00FF00,AFEEEE,ADD8E6,DDA0DD,D3D3D3,FFF0F5,FAEBD7,FFFFE0,F0FFF0,F0FFFF,F0F8FF,E6E6FA,FFF";
    i.colorButton_foreStyle = {
        element: "span",
        styles: {
            color: "#(color)"
        },
        overrides: [{
            element: "font",
            attributes: {
                color: null
            }
        }]
    };
    i.colorButton_backStyle = {
        element: "span",
        styles: {
            "background-color": "#(color)"
        }
    };
    j.colordialog = {
        requires: ["dialog"],
        init: function (b) {
            b.addCommand("colordialog", new a.dialogCommand("colordialog"));
            a.dialog.add("colordialog", this.path + "dialogs/colordialog.js");
        }
    };
    j.add("colordialog", j.colordialog);
    j.add("contextmenu", {
        requires: ["menu"],
        onLoad: function () {
            j.contextMenu = e.createClass({
                base: a.menu,
                $: function (a) {
                    this.base.call(this, a, {
                        panel: {
                            className: a.skinClass + " cke_contextmenu",
                            attributes: {
                                "aria-label": a.lang.contextmenu.options
                            }
                        }
                    });
                },
                proto: {
                    addTarget: function (a, d) {
                        if (b.opera && !("oncontextmenu" in document.body)) {
                            var f;
                            a.on("mousedown", function (c) {
                                c = c.data;
                                if (2 != c.$.button) {
                                    if (c.getKeystroke() == 1114112 + 1) a.fire("contextmenu", c);
                                    return;
                                }
                                if (d && (b.mac ? c.$.metaKey : c.$.ctrlKey)) return;
                                var e = c.getTarget();
                                if (!f) {
                                    var g = e.getDocument();
                                    f = g.createElement("input");
                                    f.$.type = "button";
                                    g.getBody().append(f);
                                }
                                f.setAttribute("style", "position:absolute;top:" + (c.$.clientY - 2) + "px;left:" + (c.$.clientX - 2) + "px;width:5px;height:5px;opacity:0.01");
                            });
                            a.on("mouseup", function (b) {
                                if (f) {
                                    f.remove();
                                    f = void 0;
                                    a.fire("contextmenu", b.data);
                                }
                            });
                        }
                        a.on("contextmenu", function (a) {
                            var f = a.data;
                            if (d && (b.webkit ? g : b.mac ? f.$.metaKey : f.$.ctrlKey)) return;
                            f.preventDefault();
                            var h = f.getTarget().getDocument().getDocumentElement(), i = f.$.clientX, j = f.$.clientY;
                            e.setTimeout(function () {
                                this.open(h, null, i, j);
                            }, c ? 200 : 0, this);
                        }, this);
                        if (b.opera) a.on("keypress", function (a) {
                            var b = a.data;
                            if (0 === b.$.keyCode) b.preventDefault();
                        });
                        if (b.webkit) {
                            var g, h = function (a) {
                                g = b.mac ? a.data.$.metaKey : a.data.$.ctrlKey;
                            }, i = function () {
                                g = 0;
                            };
                            a.on("keydown", h);
                            a.on("keyup", i);
                            a.on("contextmenu", i);
                        }
                    },
                    open: function (b, c, d, e) {
                        this.editor.focus();
                        b = b || a.document.getDocumentElement();
                        this.show(b, c, d, e);
                    }
                }
            });
        },
        beforeInit: function (a) {
            a.contextMenu = new j.contextMenu(a);
            a.addCommand("contextMenu", {
                exec: function () {
                    a.contextMenu.open(a.document.getBody());
                }
            });
        }
    });
    !function () {
        function b(a) {
            var b = this.att, c = a && a.hasAttribute(b) && a.getAttribute(b) || "";
            if (void 0 !== c) this.setValue(c);
        }
        function c() {
            var a;
            for (var b = 0; b < arguments.length; b++) if (arguments[b] instanceof h) {
                a = arguments[b];
                break;
            }
            if (a) {
                var c = this.att, d = this.getValue();
                if (d) a.setAttribute(c, d); else a.removeAttribute(c, d);
            }
        }
        j.add("dialogadvtab", {
            createAdvancedTab: function (d, f) {
                if (!f) f = {
                    id: 1,
                    dir: 1,
                    classes: 1,
                    styles: 1
                };
                var g = d.lang.common, h = {
                    id: "advanced",
                    label: g.advancedTab,
                    title: g.advancedTab,
                    elements: [{
                        type: "vbox",
                        padding: 1,
                        children: []
                    }]
                }, i = [];
                if (f.id || f.dir) {
                    if (f.id) i.push({
                        id: "advId",
                        att: "id",
                        type: "text",
                        label: g.id,
                        setup: b,
                        commit: c
                    });
                    if (f.dir) i.push({
                        id: "advLangDir",
                        att: "dir",
                        type: "select",
                        label: g.langDir,
                        "default": "",
                        style: "width:100%",
                        items: [[g.notSet, ""], [g.langDirLTR, "ltr"], [g.langDirRTL, "rtl"]],
                        setup: b,
                        commit: c
                    });
                    h.elements[0].children.push({
                        type: "hbox",
                        widths: ["50%", "50%"],
                        children: [].concat(i)
                    });
                }
                if (f.styles || f.classes) {
                    i = [];
                    if (f.styles) i.push({
                        id: "advStyles",
                        att: "style",
                        type: "text",
                        label: g.styles,
                        "default": "",
                        validate: a.dialog.validate.inlineStyle(g.invalidInlineStyle),
                        onChange: function () { },
                        getStyle: function (a, b) {
                            var c = this.getValue().match(new RegExp(a + "\\s*:\\s*([^;]*)", "i"));
                            return c ? c[1] : b;
                        },
                        updateStyle: function (a, b) {
                            var c = this.getValue(), f = d.document.createElement("span");
                            f.setAttribute("style", c);
                            f.setStyle(a, b);
                            c = e.normalizeCssText(f.getAttribute("style"));
                            this.setValue(c, 1);
                        },
                        setup: b,
                        commit: c
                    });
                    if (f.classes) i.push({
                        type: "hbox",
                        widths: ["45%", "55%"],
                        children: [{
                            id: "advCSSClasses",
                            att: "class",
                            type: "text",
                            label: g.cssClasses,
                            "default": "",
                            setup: b,
                            commit: c
                        }]
                    });
                    h.elements[0].children.push({
                        type: "hbox",
                        widths: ["50%", "50%"],
                        children: [].concat(i)
                    });
                }
                return h;
            }
        });
    }();
    !function () {
        j.add("div", {
            requires: ["editingblock", "dialog", "domiterator", "styles"],
            init: function (b) {
                var c = b.lang.div;
                b.addCommand("creatediv", new a.dialogCommand("creatediv"));
                b.addCommand("editdiv", new a.dialogCommand("editdiv"));
                b.addCommand("removediv", {
                    exec: function (a) {
                        var b = a.getSelection(), c = b && b.getRanges(), e, f = b.createBookmarks(), g, h = [];
                        function i(a) {
                            var b = new d.elementPath(a), c = b.blockLimit, e = c.is("div") && c;
                            if (e && !e.data("cke-div-added")) {
                                h.push(e);
                                e.data("cke-div-added");
                            }
                        }
                        for (var j = 0; j < c.length; j++) {
                            e = c[j];
                            if (e.collapsed) i(b.getStartElement()); else {
                                g = new d.walker(e);
                                g.evaluator = i;
                                g.lastForward();
                            }
                        }
                        for (j = 0; j < h.length; j++) h[j].remove(true);
                        b.selectBookmarks(f);
                    }
                });
                b.ui.addButton("CreateDiv", {
                    label: c.toolbar,
                    command: "creatediv"
                });
                if (b.addMenuItems) {
                    b.addMenuItems({
                        editdiv: {
                            label: c.edit,
                            command: "editdiv",
                            group: "div",
                            order: 1
                        },
                        removediv: {
                            label: c.remove,
                            command: "removediv",
                            group: "div",
                            order: 5
                        }
                    });
                    if (b.contextMenu) b.contextMenu.addListener(function (a, b) {
                        if (!a || a.isReadOnly()) return null;
                        var c = new d.elementPath(a), e = c.blockLimit;
                        if (e && e.getAscendant("div", true)) return {
                            editdiv: 2,
                            removediv: 2
                        };
                        return null;
                    });
                }
                a.dialog.add("creatediv", this.path + "dialogs/div.js");
                a.dialog.add("editdiv", this.path + "dialogs/div.js");
            }
        });
    }();
    !function () {
        var f = {
            toolbarFocus: {
                editorFocus: false,
                readOnly: 1,
                exec: function (d) {
                    var e = d._.elementsPath.idBase, f = a.document.getById(e + "0");
                    f && f.focus(c || b.air);
                }
            }
        }, g = '<span class="cke_empty">&nbsp;</span>';
        j.add("elementspath", {
            requires: ["selection"],
            init: function (c) {
                var h = "cke_path_" + c.name, i, j = function () {
                    if (!i) i = a.document.getById(h);
                    return i;
                }, k = "cke_elementspath_" + e.getNextNumber() + "_";
                c._.elementsPath = {
                    idBase: k,
                    filters: []
                };
                c.on("themeSpace", function (a) {
                    if ("bottom" == a.data.space) a.data.html += '<span id="' + h + '_label" class="cke_voice_label">' + c.lang.elementsPath.eleLabel + "</span>" + '<div id="' + h + '" class="cke_path" role="group" aria-labelledby="' + h + '_label">' + g + "</div>";
                });
                function l(a) {
                    c.focus();
                    var b = c._.elementsPath.list[a];
                    if (b.is("body")) {
                        var e = new d.range(c.document);
                        e.selectNodeContents(b);
                        e.select();
                    } else c.getSelection().selectElement(b);
                }
                var m = e.addFunction(l), n = e.addFunction(function (b, e) {
                    var f = c._.elementsPath.idBase, g;
                    e = new d.event(e);
                    var h = "rtl" == c.lang.dir;
                    switch (e.getKeystroke()) {
                        case h ? 39 : 37:
                        case 9:
                            g = a.document.getById(f + (b + 1));
                            if (!g) g = a.document.getById(f + "0");
                            g.focus();
                            return false;

                        case h ? 37 : 39:
                        case 2228224 + 9:
                            g = a.document.getById(f + (b - 1));
                            if (!g) g = a.document.getById(f + (c._.elementsPath.list.length - 1));
                            g.focus();
                            return false;

                        case 27:
                            c.focus();
                            return false;

                        case 13:
                        case 32:
                            l(b);
                            return false;
                    }
                    return true;
                });
                c.on("selectionChange", function (a) {
                    var c = b, d = a.data.selection, e = d.getStartElement(), f = [], h = a.editor, i = h._.elementsPath.list = [], l = h._.elementsPath.filters;
                    while (e) {
                        var o = 0, p;
                        if (e.data("cke-display-name")) p = e.data("cke-display-name"); else if (e.data("cke-real-element-type")) p = e.data("cke-real-element-type"); else p = e.getName();
                        for (var q = 0; q < l.length; q++) {
                            var r = l[q](e, p);
                            if (false === r) {
                                o = 1;
                                break;
                            }
                            p = r || p;
                        }
                        if (!o) {
                            var s = i.push(e) - 1, t = "";
                            if (c.opera || c.gecko && c.mac) t += ' onkeypress="return false;"';
                            if (c.gecko) t += ' onblur="this.style.cssText = this.style.cssText;"';
                            var u = h.lang.elementsPath.eleTitle.replace(/%1/, p);
                            f.unshift('<a id="', k, s, '" href="javascript:void(\'', p, '\')" tabindex="-1" title="', u, '"' + (b.gecko && b.version < 10900 ? ' onfocus="event.preventBubble();"' : "") + ' hidefocus="true" ' + ' onkeydown="return CKEDITOR.tools.callFunction(', n, ",", s, ', event );"' + t, ' onclick="CKEDITOR.tools.callFunction(' + m, ",", s, '); return false;"', ' role="button" aria-labelledby="' + k + s + '_label">', p, '<span id="', k, s, '_label" class="cke_label">' + u + "</span>", "</a>");
                        }
                        if ("body" == p) break;
                        e = e.getParent();
                    }
                    var v = j();
                    v.setHtml(f.join("") + g);
                    h.fire("elementsPathUpdate", {
                        space: v
                    });
                });
                function o() {
                    i && i.setHtml(g);
                    delete c._.elementsPath.list;
                }
                c.on("readOnly", o);
                c.on("contentDomUnload", o);
                c.addCommand("elementsPathFocus", f.toolbarFocus);
            }
        });
    }();
    !function () {
        j.add("enterkey", {
            requires: ["keystrokes", "indent"],
            init: function (a) {
                a.addCommand("enter", {
                    modes: {
                        wysiwyg: 1
                    },
                    editorFocus: false,
                    exec: function (a) {
                        k(a);
                    }
                });
                a.addCommand("shiftEnter", {
                    modes: {
                        wysiwyg: 1
                    },
                    editorFocus: false,
                    exec: function (a) {
                        i(a);
                    }
                });
                var b = a.keystrokeHandler.keystrokes;
                b[13] = "enter";
                b[2228224 + 13] = "shiftEnter";
            }
        });
        j.enterkey = {
            enterBlock: function (a, b, g, i) {
                g = g || l(a);
                if (!g) return;
                var j = g.document, k = g.checkStartOfBlock(), m = g.checkEndOfBlock(), n = new d.elementPath(g.startContainer), o = n.block;
                if (k && m) {
                    if (o && (o.is("li") || o.getParent().is("li"))) {
                        a.execCommand("outdent");
                        return;
                    }
                    if (o && o.getParent().is("blockquote")) {
                        o.breakParent(o.getParent());
                        if (!o.getPrevious().getFirst(d.walker.invisible(1))) o.getPrevious().remove();
                        if (!o.getNext().getFirst(d.walker.invisible(1))) o.getNext().remove();
                        g.moveToElementEditStart(o);
                        g.select();
                        return;
                    }
                } else if (o && o.is("pre")) {
                    if (!m) {
                        e(a, b, g, i);
                        return;
                    }
                } else if (o && f.$captionBlock[o.getName()]) {
                    e(a, b, g, i);
                    return;
                }
                var p = 3 == b ? "div" : "p", q = g.splitBlock(p);
                if (!q) return;
                var r = q.previousBlock, s = q.nextBlock, t = q.wasStartOfBlock, u = q.wasEndOfBlock, v;
                if (s) {
                    v = s.getParent();
                    if (v.is("li")) {
                        s.breakParent(v);
                        s.move(s.getNext(), 1);
                    }
                } else if (r && (v = r.getParent()) && v.is("li")) {
                    r.breakParent(v);
                    v = r.getNext();
                    g.moveToElementEditStart(v);
                    r.move(r.getPrevious());
                }
                if (!t && !u) {
                    if (s.is("li") && (v = s.getFirst(d.walker.invisible(true))) && v.is && v.is("ul", "ol")) (c ? j.createText(" ") : j.createElement("br")).insertBefore(v);
                    if (s) g.moveToElementEditStart(s);
                } else {
                    var w, x;
                    if (r) {
                        if (r.is("li") || !(h.test(r.getName()) || r.is("pre"))) w = r.clone();
                    } else if (s) w = s.clone();
                    if (!w) if (v && v.is("li")) w = v; else {
                        w = j.createElement(p);
                        if (r && (x = r.getDirection())) w.setAttribute("dir", x);
                    } else if (i && !w.is("li")) w.renameNode(p);
                    var y = q.elementPath;
                    if (y) for (var z = 0, A = y.elements.length; z < A; z++) {
                        var B = y.elements[z];
                        if (B.equals(y.block) || B.equals(y.blockLimit)) break;
                        if (f.$removeEmpty[B.getName()]) {
                            B = B.clone();
                            w.moveChildren(B);
                            w.append(B);
                        }
                    }
                    if (!c) w.appendBogus();
                    if (!w.getParent()) g.insertNode(w);
                    w.is("li") && w.removeAttribute("value");
                    if (c && t && (!u || !r.getChildCount())) {
                        g.moveToElementEditStart(u ? r : w);
                        g.select();
                    }
                    g.moveToElementEditStart(t && !u ? s : w);
                }
                if (!c) if (s) {
                    var C = j.createElement("span");
                    C.setHtml("&nbsp;");
                    g.insertNode(C);
                    C.scrollIntoView();
                    g.deleteContents();
                } else w.scrollIntoView();
                g.select();
            },
            enterBr: function (a, e, f, i) {
                f = f || l(a);
                if (!f) return;
                var j = f.document, k = 3 == e ? "div" : "p", m = f.checkEndOfBlock(), n = new d.elementPath(a.getSelection().getStartElement()), o = n.block, p = o && n.block.getName(), q = false;
                if (!i && "li" == p) {
                    g(a, e, f, i);
                    return;
                }
                if (!i && m && h.test(p)) {
                    var r, s;
                    if (s = o.getDirection()) {
                        r = j.createElement("div");
                        r.setAttribute("dir", s);
                        r.insertAfter(o);
                        f.setStart(r, 0);
                    } else {
                        j.createElement("br").insertAfter(o);
                        if (b.gecko) j.createText("").insertAfter(o);
                        f.setStartAt(o.getNext(), c ? 3 : 1);
                    }
                } else {
                    var t;
                    q = "pre" == p;
                    if (q && !b.gecko) t = j.createText(c ? "\r" : "\n"); else t = j.createElement("br");
                    f.deleteContents();
                    f.insertNode(t);
                    if (c) f.setStartAt(t, 4); else {
                        j.createText("﻿").insertAfter(t);
                        if (m) t.getParent().appendBogus();
                        t.getNext().$.nodeValue = "";
                        f.setStartAt(t.getNext(), 1);
                        var u = null;
                        if (!b.gecko) {
                            u = j.createElement("span");
                            u.setHtml("&nbsp;");
                        } else u = j.createElement("br");
                        u.insertBefore(t.getNext());
                        u.scrollIntoView();
                        u.remove();
                    }
                }
                f.collapse(true);
                f.select(q);
            }
        };
        var a = j.enterkey, e = a.enterBr, g = a.enterBlock, h = /^h[1-6]$/;
        function i(a) {
            if ("wysiwyg" != a.mode) return false;
            return k(a, a.config.shiftEnterMode, 1);
        }
        function k(a, b, c) {
            c = a.config.forceEnterMode || c;
            if ("wysiwyg" != a.mode) return false;
            if (!b) b = a.config.enterMode;
            setTimeout(function () {
                a.fire("saveSnapshot");
                if (2 == b) e(a, b, null, c); else g(a, b, null, c);
                a.fire("saveSnapshot");
            }, 0);
            return true;
        }
        function l(a) {
            var b = a.getSelection().getRanges(true);
            for (var c = b.length - 1; c > 0; c--) b[c].deleteContents();
            return b[0];
        }
    }();
    !function () {
        var a = "nbsp,gt,lt,amp", b = "quot,iexcl,cent,pound,curren,yen,brvbar,sect,uml,copy,ordf,laquo,not,shy,reg,macr,deg,plusmn,sup2,sup3,acute,micro,para,middot,cedil,sup1,ordm,raquo,frac14,frac12,frac34,iquest,times,divide,fnof,bull,hellip,prime,Prime,oline,frasl,weierp,image,real,trade,alefsym,larr,uarr,rarr,darr,harr,crarr,lArr,uArr,rArr,dArr,hArr,forall,part,exist,empty,nabla,isin,notin,ni,prod,sum,minus,lowast,radic,prop,infin,ang,and,or,cap,cup,int,there4,sim,cong,asymp,ne,equiv,le,ge,sub,sup,nsub,sube,supe,oplus,otimes,perp,sdot,lceil,rceil,lfloor,rfloor,lang,rang,loz,spades,clubs,hearts,diams,circ,tilde,ensp,emsp,thinsp,zwnj,zwj,lrm,rlm,ndash,mdash,lsquo,rsquo,sbquo,ldquo,rdquo,bdquo,dagger,Dagger,permil,lsaquo,rsaquo,euro", c = "Agrave,Aacute,Acirc,Atilde,Auml,Aring,AElig,Ccedil,Egrave,Eacute,Ecirc,Euml,Igrave,Iacute,Icirc,Iuml,ETH,Ntilde,Ograve,Oacute,Ocirc,Otilde,Ouml,Oslash,Ugrave,Uacute,Ucirc,Uuml,Yacute,THORN,szlig,agrave,aacute,acirc,atilde,auml,aring,aelig,ccedil,egrave,eacute,ecirc,euml,igrave,iacute,icirc,iuml,eth,ntilde,ograve,oacute,ocirc,otilde,ouml,oslash,ugrave,uacute,ucirc,uuml,yacute,thorn,yuml,OElig,oelig,Scaron,scaron,Yuml", d = "Alpha,Beta,Gamma,Delta,Epsilon,Zeta,Eta,Theta,Iota,Kappa,Lambda,Mu,Nu,Xi,Omicron,Pi,Rho,Sigma,Tau,Upsilon,Phi,Chi,Psi,Omega,alpha,beta,gamma,delta,epsilon,zeta,eta,theta,iota,kappa,lambda,mu,nu,xi,omicron,pi,rho,sigmaf,sigma,tau,upsilon,phi,chi,psi,omega,thetasym,upsih,piv";
        function e(a, b) {
            var c = {}, d = [], e = {
                nbsp: " ",
                shy: "­",
                gt: ">",
                lt: "<",
                amp: "&",
                apos: "'",
                quot: '"'
            };
            a = a.replace(/\b(nbsp|shy|gt|lt|amp|apos|quot)(?:,|$)/g, function (a, f) {
                var g = b ? "&" + f + ";" : e[f], h = b ? e[f] : "&" + f + ";";
                c[g] = h;
                d.push(g);
                return "";
            });
            if (!b && a) {
                a = a.split(",");
                var f = document.createElement("div"), g;
                f.innerHTML = "&" + a.join(";&") + ";";
                g = f.innerHTML;
                f = null;
                for (var h = 0; h < g.length; h++) {
                    var i = g.charAt(h);
                    c[i] = "&" + a[h] + ";";
                    d.push(i);
                }
            }
            c.regex = d.join(b ? "|" : "");
            return c;
        }
        j.add("entities", {
            afterInit: function (f) {
                var g = f.config, h = f.dataProcessor, i = h && h.htmlFilter;
                if (i) {
                    var j = [];
                    if (false !== g.basicEntities) j.push(a);
                    if (g.entities) {
                        if (j.length) j.push(b);
                        if (g.entities_latin) j.push(c);
                        if (g.entities_greek) j.push(d);
                        if (g.entities_additional) j.push(g.entities_additional);
                    }
                    var k = e(j.join(",")), l = k.regex ? "[" + k.regex + "]" : "a^";
                    delete k.regex;
                    if (g.entities && g.entities_processNumerical) l = "[^ -~]|" + l;
                    l = new RegExp(l, "g");
                    function m(a) {
                        return "force" == g.entities_processNumerical || !k[a] ? "&#" + a.charCodeAt(0) + ";" : k[a];
                    }
                    var n = e([a, "shy"].join(","), true), o = new RegExp(n.regex, "g");
                    function p(a) {
                        return n[a];
                    }
                    i.addRules({
                        text: function (a) {
                            return a.replace(o, p).replace(l, m);
                        }
                    });
                }
            }
        });
    }();
    i.basicEntities = true;
    i.entities = true;
    i.entities_latin = true;
    i.entities_greek = true;
    i.entities_additional = "#39";
    !function () {
        function b(a, b) {
            var c = [];
            if (!b) return a; else for (var d in b) c.push(d + "=" + encodeURIComponent(b[d]));
            return a + (a.indexOf("?") != -1 ? "&" : "?") + c.join("&");
        }
        function c(a) {
            a += "";
            var b = a.charAt(0).toUpperCase();
            return b + a.substr(1);
        }
        function d(a) {
            var d = this;
            var e = d.getDialog(), f = e.getParentEditor();
            f._.filebrowserSe = d;
            var g = f.config["filebrowser" + c(e.getName()) + "WindowWidth"] || f.config.filebrowserWindowWidth || "80%", h = f.config["filebrowser" + c(e.getName()) + "WindowHeight"] || f.config.filebrowserWindowHeight || "70%", i = d.filebrowser.params || {};
            i.CKEditor = f.name;
            i.CKEditorFuncNum = f._.filebrowserFn;
            if (!i.langCode) i.langCode = f.langCode;
            var j = b(d.filebrowser.url, i);
            f.popup(j, g, h, f.config.filebrowserWindowFeatures || f.config.fileBrowserWindowFeatures);
        }
        function f(a) {
            var b = this;
            var c = b.getDialog(), d = c.getParentEditor();
            d._.filebrowserSe = b;
            if (!c.getContentElement(b["for"][0], b["for"][1]).getInputElement().$.value) return false;
            if (!c.getContentElement(b["for"][0], b["for"][1]).getAction()) return false;
            return true;
        }
        function g(a, c, d) {
            var e = d.params || {};
            e.CKEditor = a.name;
            e.CKEditorFuncNum = a._.filebrowserFn;
            if (!e.langCode) e.langCode = a.langCode;
            c.action = b(d.url, e);
            c.filebrowser = d;
        }
        function h(a, b, e, i) {
            var j, k;
            for (var l in i) {
                j = i[l];
                if ("hbox" == j.type || "vbox" == j.type || "fieldset" == j.type) h(a, b, e, j.children);
                if (!j.filebrowser) continue;
                if ("string" == typeof j.filebrowser) {
                    var m = {
                        action: "fileButton" == j.type ? "QuickUpload" : "Browse",
                        target: j.filebrowser
                    };
                    j.filebrowser = m;
                }
                if ("Browse" == j.filebrowser.action) {
                    var n = j.filebrowser.url;
                    if (void 0 === n) {
                        n = a.config["filebrowser" + c(b) + "BrowseUrl"];
                        if (void 0 === n) n = a.config.filebrowserBrowseUrl;
                    }
                    if (n) {
                        j.onClick = d;
                        j.filebrowser.url = n;
                        j.hidden = false;
                    }
                } else if ("QuickUpload" == j.filebrowser.action && j["for"]) {
                    n = j.filebrowser.url;
                    if (void 0 === n) {
                        n = a.config["filebrowser" + c(b) + "UploadUrl"];
                        if (void 0 === n) n = a.config.filebrowserUploadUrl;
                    }
                    if (n) {
                        var o = j.onClick;
                        j.onClick = function (a) {
                            var b = a.sender;
                            if (o && false === o.call(b, a)) return false;
                            return f.call(b, a);
                        };
                        j.filebrowser.url = n;
                        j.hidden = false;
                        g(a, e.getContents(j["for"][0]).get(j["for"][1]), j.filebrowser);
                    }
                }
            }
        }
        function i(a, b) {
            var c = b.getDialog(), d = b.filebrowser.target || null;
            if (d) {
                var e = d.split(":"), f = c.getContentElement(e[0], e[1]);
                if (f) {
                    f.setValue(a);
                    c.selectPage(e[0]);
                }
            }
        }
        function k(a, b, c) {
            if (c.indexOf(";") !== -1) {
                var d = c.split(";");
                for (var e = 0; e < d.length; e++) if (k(a, b, d[e])) return true;
                return false;
            }
            var f = a.getContents(b).get(c).filebrowser;
            return f && f.url;
        }
        function l(a, b) {
            var c = this;
            var d = c._.filebrowserSe.getDialog(), e = c._.filebrowserSe["for"], f = c._.filebrowserSe.filebrowser.onSelect;
            if (e) d.getContentElement(e[0], e[1]).reset();
            if ("function" == typeof b && false === b.call(c._.filebrowserSe)) return;
            if (f && false === f.call(c._.filebrowserSe, a, b)) return;
            if ("string" == typeof b && b) alert(b);
            if (a) i(a, c._.filebrowserSe);
        }
        j.add("filebrowser", {
            init: function (a, b) {
                a._.filebrowserFn = e.addFunction(l, a);
                a.on("destroy", function () {
                    e.removeFunction(this._.filebrowserFn);
                });
            }
        });
        a.on("dialogDefinition", function (a) {
            var b = a.data.definition, c;
            for (var d in b.contents) if (c = b.contents[d]) {
                h(a.editor, a.data.name, b, c.elements);
                if (c.hidden && c.filebrowser) c.hidden = !k(b, c.id, c.filebrowser);
            }
        });
    }();
    j.add("find", {
        requires: ["dialog"],
        init: function (b) {
            var c = j.find;
            b.ui.addButton("Find", {
                label: b.lang.findAndReplace.find,
                command: "find"
            });
            var d = b.addCommand("find", new a.dialogCommand("find"));
            d.canUndo = false;
            d.readOnly = 1;
            b.ui.addButton("Replace", {
                label: b.lang.findAndReplace.replace,
                command: "replace"
            });
            var e = b.addCommand("replace", new a.dialogCommand("replace"));
            e.canUndo = false;
            a.dialog.add("find", this.path + "dialogs/find.js");
            a.dialog.add("replace", this.path + "dialogs/find.js");
        },
        requires: ["styles"]
    });
    i.find_highlight = {
        element: "span",
        styles: {
            "background-color": "#004",
            color: "#fff"
        }
    };
    !function () {
        var b = /\.swf(?:$|\?)/i;
        function c(a) {
            var c = a.attributes;
            return "application/x-shockwave-flash" == c.type || b.test(c.src || "");
        }
        function d(a, b) {
            return a.createFakeParserElement(b, "cke_flash", "flash", true);
        }
        j.add("flash", {
            init: function (b) {
                b.addCommand("flash", new a.dialogCommand("flash"));
                b.ui.addButton("Flash", {
                    label: b.lang.common.flash,
                    command: "flash"
                });
                a.dialog.add("flash", this.path + "dialogs/flash.js");
                b.addCss("img.cke_flash{background-image: url(" + a.getUrl(this.path + "images/placeholder.png") + ");" + "background-position: center center;" + "background-repeat: no-repeat;" + "border: 1px solid #a9a9a9;" + "width: 80px;" + "height: 80px;" + "}");
                if (b.addMenuItems) b.addMenuItems({
                    flash: {
                        label: b.lang.flash.properties,
                        command: "flash",
                        group: "flash"
                    }
                });
                b.on("doubleclick", function (a) {
                    var b = a.data.element;
                    if (b.is("img") && "flash" == b.data("cke-real-element-type")) a.data.dialog = "flash";
                });
                if (b.contextMenu) b.contextMenu.addListener(function (a, b) {
                    if (a && a.is("img") && !a.isReadOnly() && "flash" == a.data("cke-real-element-type")) return {
                        flash: 2
                    };
                });
            },
            afterInit: function (a) {
                var b = a.dataProcessor, e = b && b.dataFilter;
                if (e) e.addRules({
                    elements: {
                        "cke:object": function (b) {
                            var e = b.attributes, f = e.classid && String(e.classid).toLowerCase();
                            if (!f && !c(b)) {
                                for (var g = 0; g < b.children.length; g++) if ("cke:embed" == b.children[g].name) {
                                    if (!c(b.children[g])) return null;
                                    return d(a, b);
                                }
                                return null;
                            }
                            return d(a, b);
                        },
                        "cke:embed": function (b) {
                            if (!c(b)) return null;
                            return d(a, b);
                        }
                    }
                }, 5);
            },
            requires: ["fakeobjects"]
        });
    }();
    e.extend(i, {
        flashEmbedTagOnly: false,
        flashAddEmbedTag: true,
        flashConvertOnEdit: false
    });
    !function () {
        function b(b, c, d, e, f, g, h) {
            var i = b.config, j = f.split(";"), k = [], l = {};
            for (var m = 0; m < j.length; m++) {
                var n = j[m];
                if (n) {
                    n = n.split("/");
                    var o = {}, p = j[m] = n[0];
                    o[d] = k[m] = n[1] || p;
                    l[p] = new a.style(h, o);
                    l[p]._.definition.name = p;
                } else j.splice(m--, 1);
            }
            b.ui.addRichCombo(c, {
                label: e.label,
                title: e.panelTitle,
                className: "cke_" + ("size" == d ? "fontSize" : "font"),
                panel: {
                    css: b.skin.editor.css.concat(i.contentsCss),
                    multiSelect: false,
                    attributes: {
                        "aria-label": e.panelTitle
                    }
                },
                init: function () {
                    this.startGroup(e.panelTitle);
                    for (var a = 0; a < j.length; a++) {
                        var b = j[a];
                        this.add(b, l[b].buildPreview(), b);
                    }
                },
                onClick: function (a) {
                    b.focus();
                    b.fire("saveSnapshot");
                    var c = l[a];
                    if (this.getValue() == a) c.remove(b.document); else c.apply(b.document);
                    b.fire("saveSnapshot");
                },
                onRender: function () {
                    b.on("selectionChange", function (a) {
                        var b = this.getValue(), c = a.data.path, d = c.elements;
                        for (var e = 0, f; e < d.length; e++) {
                            f = d[e];
                            for (var h in l) if (l[h].checkElementMatch(f, true)) {
                                if (h != b) this.setValue(h);
                                return;
                            }
                        }
                        this.setValue("", g);
                    }, this);
                }
            });
        }
        j.add("font", {
            requires: ["richcombo", "styles"],
            init: function (a) {
                var c = a.config;
                b(a, "Font", "family", a.lang.font, c.font_names, c.font_defaultLabel, c.font_style);
                b(a, "FontSize", "size", a.lang.fontSize, c.fontSize_sizes, c.fontSize_defaultLabel, c.fontSize_style);
            }
        });
    }();
    i.font_names = "Arial/Arial, Helvetica, sans-serif;Comic Sans MS/Comic Sans MS, cursive;Courier New/Courier New, Courier, monospace;Georgia/Georgia, serif;Lucida Sans Unicode/Lucida Sans Unicode, Lucida Grande, sans-serif;Tahoma/Tahoma, Geneva, sans-serif;Times New Roman/Times New Roman, Times, serif;Trebuchet MS/Trebuchet MS, Helvetica, sans-serif;Verdana/Verdana, Geneva, sans-serif";
    i.font_defaultLabel = "";
    i.font_style = {
        element: "span",
        styles: {
            "font-family": "#(family)"
        },
        overrides: [{
            element: "font",
            attributes: {
                face: null
            }
        }]
    };
    i.fontSize_sizes = "8/8px;9/9px;10/10px;11/11px;12/12px;14/14px;16/16px;18/18px;20/20px;22/22px;24/24px;26/26px;28/28px;36/36px;48/48px;72/72px";
    i.fontSize_defaultLabel = "";
    i.fontSize_style = {
        element: "span",
        styles: {
            "font-size": "#(size)"
        },
        overrides: [{
            element: "font",
            attributes: {
                size: null
            }
        }]
    };
    j.add("format", {
        requires: ["richcombo", "styles"],
        init: function (b) {
            var c = b.config, e = b.lang.format, f = c.format_tags.split(";"), g = {};
            for (var h = 0; h < f.length; h++) {
                var i = f[h];
                g[i] = new a.style(c["format_" + i]);
                g[i]._.enterMode = b.config.enterMode;
            }
            b.ui.addRichCombo("Format", {
                label: e.label,
                title: e.panelTitle,
                className: "cke_format",
                panel: {
                    css: b.skin.editor.css.concat(c.contentsCss),
                    multiSelect: false,
                    attributes: {
                        "aria-label": e.panelTitle
                    }
                },
                init: function () {
                    this.startGroup(e.panelTitle);
                    for (var a in g) {
                        var b = e["tag_" + a];
                        this.add(a, g[a].buildPreview(b), b);
                    }
                },
                onClick: function (a) {
                    b.focus();
                    b.fire("saveSnapshot");
                    var c = g[a], e = new d.elementPath(b.getSelection().getStartElement());
                    c[c.checkActive(e) ? "remove" : "apply"](b.document);
                    setTimeout(function () {
                        b.fire("saveSnapshot");
                    }, 0);
                },
                onRender: function () {
                    b.on("selectionChange", function (a) {
                        var c = this.getValue(), d = a.data.path;
                        for (var e in g) if (g[e].checkActive(d)) {
                            if (e != c) this.setValue(e, b.lang.format["tag_" + e]);
                            return;
                        }
                        this.setValue("");
                    }, this);
                }
            });
        }
    });
    i.format_tags = "p;h1;h2;h3;h4;h5;h6;pre;address;div";
    i.format_p = {
        element: "p"
    };
    i.format_div = {
        element: "div"
    };
    i.format_pre = {
        element: "pre"
    };
    i.format_address = {
        element: "address"
    };
    i.format_h1 = {
        element: "h1"
    };
    i.format_h2 = {
        element: "h2"
    };
    i.format_h3 = {
        element: "h3"
    };
    i.format_h4 = {
        element: "h4"
    };
    i.format_h5 = {
        element: "h5"
    };
    i.format_h6 = {
        element: "h6"
    };
    j.add("forms", {
        requires: ["dialog"],
        init: function (b) {
            var c = b.lang;
            b.addCss("form{border: 1px dotted #FF0000;padding: 2px;}\n");
            b.addCss("img.cke_hidden{background-image: url(" + a.getUrl(this.path + "images/hiddenfield.gif") + ");" + "background-position: center center;" + "background-repeat: no-repeat;" + "border: 1px solid #a9a9a9;" + "width: 16px !important;" + "height: 16px !important;" + "}");
            var d = function (d, e, f) {
                b.addCommand(e, new a.dialogCommand(e));
                b.ui.addButton(d, {
                    label: c.common[d.charAt(0).toLowerCase() + d.slice(1)],
                    command: e
                });
                a.dialog.add(e, f);
            }, e = this.path + "dialogs/";
            d("Form", "form", e + "form.js");
            d("Checkbox", "checkbox", e + "checkbox.js");
            d("Radio", "radio", e + "radio.js");
            d("TextField", "textfield", e + "textfield.js");
            d("Textarea", "textarea", e + "textarea.js");
            d("Select", "select", e + "select.js");
            d("Button", "button", e + "button.js");
            d("ImageButton", "imagebutton", j.getPath("image") + "dialogs/image.js");
            d("HiddenField", "hiddenfield", e + "hiddenfield.js");
            if (b.addMenuItems) b.addMenuItems({
                form: {
                    label: c.form.menu,
                    command: "form",
                    group: "form"
                },
                checkbox: {
                    label: c.checkboxAndRadio.checkboxTitle,
                    command: "checkbox",
                    group: "checkbox"
                },
                radio: {
                    label: c.checkboxAndRadio.radioTitle,
                    command: "radio",
                    group: "radio"
                },
                textfield: {
                    label: c.textfield.title,
                    command: "textfield",
                    group: "textfield"
                },
                hiddenfield: {
                    label: c.hidden.title,
                    command: "hiddenfield",
                    group: "hiddenfield"
                },
                imagebutton: {
                    label: c.image.titleButton,
                    command: "imagebutton",
                    group: "imagebutton"
                },
                button: {
                    label: c.button.title,
                    command: "button",
                    group: "button"
                },
                select: {
                    label: c.select.title,
                    command: "select",
                    group: "select"
                },
                textarea: {
                    label: c.textarea.title,
                    command: "textarea",
                    group: "textarea"
                }
            });
            if (b.contextMenu) {
                b.contextMenu.addListener(function (a) {
                    if (a && a.hasAscendant("form", true) && !a.isReadOnly()) return {
                        form: 2
                    };
                });
                b.contextMenu.addListener(function (a) {
                    if (a && !a.isReadOnly()) {
                        var b = a.getName();
                        if ("select" == b) return {
                            select: 2
                        };
                        if ("textarea" == b) return {
                            textarea: 2
                        };
                        if ("input" == b) switch (a.getAttribute("type")) {
                            case "button":
                            case "submit":
                            case "reset":
                                return {
                                    button: 2
                                };

                            case "checkbox":
                                return {
                                    checkbox: 2
                                };

                            case "radio":
                                return {
                                    radio: 2
                                };

                            case "image":
                                return {
                                    imagebutton: 2
                                };

                            default:
                                return {
                                    textfield: 2
                                };
                        }
                        if ("img" == b && "hiddenfield" == a.data("cke-real-element-type")) return {
                            hiddenfield: 2
                        };
                    }
                });
            }
            b.on("doubleclick", function (a) {
                var b = a.data.element;
                if (b.is("form")) a.data.dialog = "form"; else if (b.is("select")) a.data.dialog = "select"; else if (b.is("textarea")) a.data.dialog = "textarea"; else if (b.is("img") && "hiddenfield" == b.data("cke-real-element-type")) a.data.dialog = "hiddenfield"; else if (b.is("input")) switch (b.getAttribute("type")) {
                    case "button":
                    case "submit":
                    case "reset":
                        a.data.dialog = "button";
                        break;

                    case "checkbox":
                        a.data.dialog = "checkbox";
                        break;

                    case "radio":
                        a.data.dialog = "radio";
                        break;

                    case "image":
                        a.data.dialog = "imagebutton";
                        break;

                    default:
                        a.data.dialog = "textfield";
                }
            });
        },
        afterInit: function (a) {
            var b = a.dataProcessor, d = b && b.htmlFilter, e = b && b.dataFilter;
            if (c) d && d.addRules({
                elements: {
                    input: function (a) {
                        var b = a.attributes, c = b.type;
                        if (!c) b.type = "text";
                        if ("checkbox" == c || "radio" == c) "on" == b.value && delete b.value;
                    }
                }
            });
            if (e) e.addRules({
                elements: {
                    input: function (b) {
                        if ("hidden" == b.attributes.type) return a.createFakeParserElement(b, "cke_hidden", "hiddenfield");
                    }
                }
            });
        },
        requires: ["image", "fakeobjects"]
    });
    if (c) h.prototype.hasAttribute = e.override(h.prototype.hasAttribute, function (a) {
        return function (b) {
            var c = this;
            var d = c.$.attributes.getNamedItem(b);
            if ("input" == c.getName()) switch (b) {
                case "class":
                    return c.$.className.length > 0;

                case "checked":
                    return !!c.$.checked;

                case "value":
                    var e = c.getAttribute("type");
                    return "checkbox" == e || "radio" == e ? "on" != c.$.value : c.$.value;
            }
            return a.apply(c, arguments);
        };
    });
    !function () {
        var a = {
            canUndo: false,
            exec: function (a) {
                var b = a.document.createElement("hr");
                a.insertElement(b);
            }
        }, b = "horizontalrule";
        j.add(b, {
            init: function (c) {
                c.addCommand(b, a);
                c.ui.addButton("HorizontalRule", {
                    label: c.lang.horizontalrule,
                    command: b
                });
            }
        });
    }();
    !function () {
        var b = /^[\t\r\n ]*(?:&nbsp;|\xa0)$/, d = "{cke_protected}";
        function g(a) {
            var b = a.children.length, c = a.children[b - 1];
            while (c && 3 == c.type && !e.trim(c.value)) c = a.children[--b];
            return c;
        }
        function k(a) {
            var b = a.parent;
            return b ? e.indexOf(b.children, a) : -1;
        }
        function l(a, d) {
            var e = a.children, f = g(a);
            if (f) {
                if ((d || !c) && 1 == f.type && "br" == f.name) e.pop();
                if (3 == f.type && b.test(f.value)) e.pop();
            }
        }
        function m(a, b, d) {
            if (!b && (!d || "function" == typeof d && false === d(a))) return false;
            if (b && c && (document.documentMode > 7 || a.name in f.tr || a.name in f.$listItem)) return false;
            var e = g(a);
            return !e || e && (1 == e.type && "br" == e.name || "form" == a.name && "input" == e.name);
        }
        function n(b, d) {
            return function (e) {
                l(e, !b);
                if (m(e, !b, d)) if (b || c) e.add(new a.htmlParser.text(" ")); else e.add(new a.htmlParser.element("br", {}));
            };
        }
        var o = f, p = ["caption", "colgroup", "col", "thead", "tfoot", "tbody"], q = e.extend({}, o.$block, o.$listItem, o.$tableContent);
        for (var r in q) if (!("br" in o[r])) delete q[r];
        delete q.pre;
        var s = {
            elements: {},
            attributeNames: [[/^on/, "data-cke-pa-on"]]
        }, t = {
            elements: {}
        };
        for (r in q) t.elements[r] = n();
        var u = {
            elementNames: [[/^cke:/, ""], [/^\?xml:namespace$/, ""]],
            attributeNames: [[/^data-cke-(saved|pa)-/, ""], [/^data-cke-.*/, ""], ["hidefocus", ""]],
            elements: {
                $: function (a) {
                    var b = a.attributes;
                    if (b) {
                        if (b["data-cke-temp"]) return false;
                        var c = ["name", "href", "src"], d;
                        for (var e = 0; e < c.length; e++) {
                            d = "data-cke-saved-" + c[e];
                            d in b && delete b[c[e]];
                        }
                    }
                    return a;
                },
                table: function (a) {
                    var b = a.children.slice(0);
                    b.sort(function (a, b) {
                        var c, d;
                        if (1 == a.type && b.type == a.type) {
                            c = e.indexOf(p, a.name);
                            d = e.indexOf(p, b.name);
                        }
                        if (!(c > -1 && d > -1 && c != d)) {
                            c = k(a);
                            d = k(b);
                        }
                        return c > d ? 1 : -1;
                    });
                },
                embed: function (a) {
                    var b = a.parent;
                    if (b && "object" == b.name) {
                        var c = b.attributes.width, d = b.attributes.height;
                        c && (a.attributes.width = c);
                        d && (a.attributes.height = d);
                    }
                },
                param: function (a) {
                    a.children = [];
                    a.isEmpty = true;
                    return a;
                },
                a: function (a) {
                    if (!(a.children.length || a.attributes.name || a.attributes["data-cke-saved-name"])) return false;
                },
                span: function (a) {
                    if ("Apple-style-span" == a.attributes["class"]) delete a.name;
                },
                pre: function (a) {
                    c && l(a);
                },
                html: function (a) {
                    delete a.attributes.contenteditable;
                    delete a.attributes["class"];
                },
                body: function (a) {
                    delete a.attributes.spellcheck;
                    delete a.attributes.contenteditable;
                },
                style: function (a) {
                    var b = a.children[0];
                    b && b.value && (b.value = e.trim(b.value));
                    if (!a.attributes.type) a.attributes.type = "text/css";
                },
                title: function (a) {
                    var b = a.children[0];
                    b && (b.value = a.attributes["data-cke-title"] || "");
                }
            },
            attributes: {
                "class": function (a, b) {
                    return e.ltrim(a.replace(/(?:^|\s+)cke_[^\s]*/g, "")) || false;
                }
            }
        };
        if (c) u.attributes.style = function (a, b) {
            return a.replace(/(^|;)([^\:]+)/g, function (a) {
                return a.toLowerCase();
            });
        };
        function v(a) {
            var b = a.attributes;
            if ("false" != b.contenteditable) b["data-cke-editable"] = b.contenteditable ? "true" : 1;
            b.contenteditable = "false";
        }
        function w(a) {
            var b = a.attributes;
            switch (b["data-cke-editable"]) {
                case "true":
                    b.contenteditable = "true";
                    break;

                case "1":
                    delete b.contenteditable;
            }
        }
        for (r in {
            input: 1,
            textarea: 1
        }) {
            s.elements[r] = v;
            u.elements[r] = w;
        }
        var x = /<(a|area|img|input|source)\b([^>]*)>/gi, y = /\b(on\w+|href|src|name)\s*=\s*(?:(?:"[^"]*")|(?:'[^']*')|(?:[^ "'>]+))/gi, z = /(?:<style(?=[ >])[^>]*>[\s\S]*<\/style>)|(?:<(:?link|meta|base)[^>]*>)/gi, A = /<cke:encoded>([^<]*)<\/cke:encoded>/gi, B = /(<\/?)((?:object|embed|param|html|body|head|title)[^>]*>)/gi, C = /(<\/?)cke:((?:html|body|head|title)[^>]*>)/gi, D = /<cke:(param|embed)([^>]*?)\/?>(?!\s*<\/cke:\1)/gi;
        function E(b) {
            return b.replace(x, function (b, c, d) {
                return "<" + c + d.replace(y, function (b, c) {
                    if (!/^on/.test(c) && d.indexOf("data-cke-saved-" + c) == -1) return " data-cke-saved-" + b + " data-cke-" + a.rnd + "-" + b;
                    return b;
                }) + ">";
            });
        }
        function F(a) {
            return a.replace(z, function (a) {
                return "<cke:encoded>" + encodeURIComponent(a) + "</cke:encoded>";
            });
        }
        function G(a) {
            return a.replace(A, function (a, b) {
                return decodeURIComponent(b);
            });
        }
        function H(a) {
            return a.replace(B, "$1cke:$2");
        }
        function I(a) {
            return a.replace(C, "$1$2");
        }
        function J(a) {
            return a.replace(D, "<cke:$1$2></cke:$1>");
        }
        function K(a) {
            return a.replace(/(<pre\b[^>]*>)(\r\n|\n)/g, "$1$2$2");
        }
        function L(a) {
            return a.replace(/<!--(?!{cke_protected})[\s\S]+?-->/g, function (a) {
                return "<!--" + d + "{C}" + encodeURIComponent(a).replace(/--/g, "%2D%2D") + "-->";
            });
        }
        function M(a) {
            return a.replace(/<!--\{cke_protected\}\{C\}([\s\S]+?)-->/g, function (a, b) {
                return decodeURIComponent(b);
            });
        }
        function N(a, b) {
            var c = b._.dataStore;
            return a.replace(/<!--\{cke_protected\}([\s\S]+?)-->/g, function (a, b) {
                return decodeURIComponent(b);
            }).replace(/\{cke_protected_(\d+)\}/g, function (a, b) {
                return c && c[b] || "";
            });
        }
        function O(a, b) {
            var c = [], e = b.config.protectedSource, f = b._.dataStore || (b._.dataStore = {
                id: 1
            }), g = /<\!--\{cke_temp(comment)?\}(\d*?)-->/g, h = [/<script[\s\S]*?<\/script>/gi, /<noscript[\s\S]*?<\/noscript>/gi].concat(e);
            a = a.replace(/<!--[\s\S]*?-->/g, function (a) {
                return "<!--{cke_tempcomment}" + (c.push(a) - 1) + "-->";
            });
            for (var i = 0; i < h.length; i++) a = a.replace(h[i], function (a) {
                a = a.replace(g, function (a, b, d) {
                    return c[d];
                });
                return /cke_temp(comment)?/.test(a) ? a : "<!--{cke_temp}" + (c.push(a) - 1) + "-->";
            });
            a = a.replace(g, function (a, b, e) {
                return "<!--" + d + (b ? "{C}" : "") + encodeURIComponent(c[e]).replace(/--/g, "%2D%2D") + "-->";
            });
            return a.replace(/(['"]).*?\1/g, function (a) {
                return a.replace(/<!--\{cke_protected\}([\s\S]+?)-->/g, function (a, b) {
                    f[f.id] = decodeURIComponent(b);
                    return "{cke_protected_" + f.id++ + "}";
                });
            });
        }
        j.add("htmldataprocessor", {
            requires: ["htmlwriter"],
            init: function (b) {
                var c = b.dataProcessor = new a.htmlDataProcessor(b);
                c.writer.forceSimpleAmpersand = b.config.forceSimpleAmpersand;
                c.dataFilter.addRules(s);
                c.dataFilter.addRules(t);
                c.htmlFilter.addRules(u);
                var d = {
                    elements: {}
                };
                for (r in q) d.elements[r] = n(true, b.config.fillEmptyBlocks);
                c.htmlFilter.addRules(d);
            },
            onLoad: function () {
                !("fillEmptyBlocks" in i) && (i.fillEmptyBlocks = 1);
            }
        });
        a.htmlDataProcessor = function (b) {
            var c = this;
            c.editor = b;
            c.writer = new a.htmlWriter();
            c.dataFilter = new a.htmlParser.filter();
            c.htmlFilter = new a.htmlParser.filter();
        };
        a.htmlDataProcessor.prototype = {
            toHtml: function (b, c) {
                b = O(b, this.editor);
                b = E(b);
                b = F(b);
                b = H(b);
                b = J(b);
                b = K(b);
                var d = new h("div");
                d.setHtml("a" + b);
                b = d.getHtml().substr(1);
                b = b.replace(new RegExp(" data-cke-" + a.rnd + "-", "ig"), " ");
                b = I(b);
                b = G(b);
                b = M(b);
                var e = a.htmlParser.fragment.fromHtml(b, c), f = new a.htmlParser.basicWriter();
                e.writeHtml(f, this.dataFilter);
                b = f.getHtml(true);
                b = L(b);
                return b;
            },
            toDataFormat: function (b, c) {
                var d = this.writer, e = a.htmlParser.fragment.fromHtml(b, c);
                d.reset();
                e.writeHtml(d, this.htmlFilter);
                var f = d.getHtml(true);
                f = M(f);
                f = N(f, this.editor);
                return f;
            }
        };
    }();
    !function () {
        j.add("iframe", {
            requires: ["dialog", "fakeobjects"],
            init: function (b) {
                var c = "iframe", d = b.lang.iframe;
                a.dialog.add(c, this.path + "dialogs/iframe.js");
                b.addCommand(c, new a.dialogCommand(c));
                b.addCss("img.cke_iframe{background-image: url(" + a.getUrl(this.path + "images/placeholder.png") + ");" + "background-position: center center;" + "background-repeat: no-repeat;" + "border: 1px solid #a9a9a9;" + "width: 80px;" + "height: 80px;" + "}");
                b.ui.addButton("Iframe", {
                    label: d.toolbar,
                    command: c
                });
                b.on("doubleclick", function (a) {
                    var b = a.data.element;
                    if (b.is("img") && "iframe" == b.data("cke-real-element-type")) a.data.dialog = "iframe";
                });
                if (b.addMenuItems) b.addMenuItems({
                    iframe: {
                        label: d.title,
                        command: "iframe",
                        group: "image"
                    }
                });
                if (b.contextMenu) b.contextMenu.addListener(function (a, b) {
                    if (a && a.is("img") && "iframe" == a.data("cke-real-element-type")) return {
                        iframe: 2
                    };
                });
            },
            afterInit: function (a) {
                var b = a.dataProcessor, c = b && b.dataFilter;
                if (c) c.addRules({
                    elements: {
                        iframe: function (b) {
                            return a.createFakeParserElement(b, "cke_iframe", "iframe", true);
                        }
                    }
                });
            }
        });
    }();
    !function () {
        j.add("image", {
            requires: ["dialog"],
            init: function (c) {
                var d = "image";
                a.dialog.add(d, this.path + "dialogs/image.js");
                c.addCommand(d, new a.dialogCommand(d));
                c.ui.addButton("Image", {
                    label: c.lang.common.image,
                    command: d
                });
                c.on("doubleclick", function (a) {
                    var b = a.data.element;
                    if (b.is("img") && !b.data("cke-realelement") && !b.isReadOnly()) a.data.dialog = "image";
                });
                if (c.addMenuItems) c.addMenuItems({
                    image: {
                        label: c.lang.image.menu,
                        command: "image",
                        group: "image"
                    }
                });
                if (c.contextMenu) c.contextMenu.addListener(function (a, d) {
                    if (b(c, a)) return {
                        image: 2
                    };
                });
            },
            afterInit: function (a) {
                d("left");
                d("right");
                d("center");
                d("block");
                function d(d) {
                    var e = a.getCommand("justify" + d);
                    if (e) {
                        if ("left" == d || "right" == d) e.on("exec", function (e) {
                            var f = b(a), g;
                            if (f) {
                                g = c(f);
                                if (g == d) {
                                    f.removeStyle("float");
                                    if (d == c(f)) f.removeAttribute("align");
                                } else f.setStyle("float", d);
                                e.cancel();
                            }
                        });
                        e.on("refresh", function (e) {
                            var f = b(a), g;
                            if (f) {
                                g = c(f);
                                this.setState(g == d ? 1 : "right" == d || "left" == d ? 2 : 0);
                                e.cancel();
                            }
                        });
                    }
                }
            }
        });
        function b(a, b) {
            if (!b) {
                var c = a.getSelection();
                b = 3 == c.getType() && c.getSelectedElement();
            }
            if (b && b.is("img") && !b.data("cke-realelement") && !b.isReadOnly()) return b;
        }
        function c(a) {
            var b = a.getStyle("float");
            if ("inherit" == b || "none" == b) b = 0;
            if (!b) b = a.getAttribute("align");
            return b;
        }
    }();
    i.image_removeLinkByEmptyURL = true;
    !function () {
        var a = {
            ol: 1,
            ul: 1
        }, f = d.walker.whitespaces(true), g = d.walker.bookmark(false, true);
        function i(b) {
            var c = this;
            if (b.editor.readOnly) return null;
            var d = b.editor, e = b.data.path, f = e && e.contains(a), g = e.block || e.blockLimit;
            if (f) return c.setState(2);
            if (!c.useIndentClasses && "indent" == c.name) return c.setState(2);
            if (!g) return c.setState(0);
            if (c.useIndentClasses) {
                var h = g.$.className.match(c.classNameRegex), i = 0;
                if (h) {
                    h = h[1];
                    i = c.indentClassMap[h];
                }
                if ("outdent" == c.name && !i || "indent" == c.name && i == d.config.indentClasses.length) return c.setState(0);
                return c.setState(2);
            } else {
                var j = parseInt(g.getStyle(l(g)), 10);
                if (isNaN(j)) j = 0;
                if (j <= 0) return c.setState(0);
                return c.setState(2);
            }
        }
        function k(a, b) {
            var c = this;
            c.name = b;
            c.useIndentClasses = a.config.indentClasses && a.config.indentClasses.length > 0;
            if (c.useIndentClasses) {
                c.classNameRegex = new RegExp("(?:^|\\s+)(" + a.config.indentClasses.join("|") + ")(?=$|\\s)");
                c.indentClassMap = {};
                for (var d = 0; d < a.config.indentClasses.length; d++) c.indentClassMap[a.config.indentClasses[d]] = d + 1;
            }
            c.startDisabled = "outdent" == b;
        }
        function l(a, b) {
            return "ltr" == (b || a.getComputedStyle("direction")) ? "margin-left" : "margin-right";
        }
        function m(a) {
            return 1 == a.type && a.is("li");
        }
        k.prototype = {
            exec: function (b) {
                var i = this, k = {};
                function n(d) {
                    var e = t.startContainer, l = t.endContainer;
                    while (e && !e.getParent().equals(d)) e = e.getParent();
                    while (l && !l.getParent().equals(d)) l = l.getParent();
                    if (!e || !l) return;
                    var m = e, n = [], o = false;
                    while (!o) {
                        if (m.equals(l)) o = true;
                        n.push(m);
                        m = m.getNext();
                    }
                    if (n.length < 1) return;
                    var p = d.getParents(true);
                    for (var q = 0; q < p.length; q++) if (p[q].getName && a[p[q].getName()]) {
                        d = p[q];
                        break;
                    }
                    var r = "indent" == i.name ? 1 : -1, s = n[0], u = n[n.length - 1], v = j.list.listToArray(d, k), w = v[u.getCustomData("listarray_index")].indent;
                    for (q = s.getCustomData("listarray_index"); q <= u.getCustomData("listarray_index"); q++) {
                        v[q].indent += r;
                        if (r > 0) {
                            var x = v[q].parent;
                            v[q].parent = new h(x.getName(), x.getDocument());
                        }
                    }
                    for (q = u.getCustomData("listarray_index") + 1; q < v.length && v[q].indent > w; q++) v[q].indent += r;
                    var y = j.list.arrayToList(v, k, null, b.config.enterMode, d.getDirection());
                    if ("outdent" == i.name) {
                        var z;
                        if ((z = d.getParent()) && z.is("li")) {
                            var A = y.listNode.getChildren(), B = [], C = A.count(), D;
                            for (q = C - 1; q >= 0; q--) if ((D = A.getItem(q)) && D.is && D.is("li")) B.push(D);
                        }
                    }
                    if (y) y.listNode.replace(d);
                    if (B && B.length) for (q = 0; q < B.length; q++) {
                        var E = B[q], F = E;
                        while ((F = F.getNext()) && F.is && F.getName() in a) {
                            if (c && !E.getFirst(function (a) {
                                return f(a) && g(a);
                            })) E.append(t.document.createText(" "));
                            E.append(F);
                        }
                        E.insertAfter(z);
                    }
                }
                function o() {
                    var a = t.createIterator(), c = b.config.enterMode;
                    a.enforceRealBlocks = true;
                    a.enlargeBr = 2 != c;
                    var d;
                    while (d = a.getNextParagraph(1 == c ? "p" : "div")) p(d);
                }
                function p(a, c) {
                    if (a.getCustomData("indent_processed")) return false;
                    if (i.useIndentClasses) {
                        var d = a.$.className.match(i.classNameRegex), f = 0;
                        if (d) {
                            d = d[1];
                            f = i.indentClassMap[d];
                        }
                        if ("outdent" == i.name) f--; else f++;
                        if (f < 0) return false;
                        f = Math.min(f, b.config.indentClasses.length);
                        f = Math.max(f, 0);
                        a.$.className = e.ltrim(a.$.className.replace(i.classNameRegex, ""));
                        if (f > 0) a.addClass(b.config.indentClasses[f - 1]);
                    } else {
                        var g = l(a, c), j = parseInt(a.getStyle(g), 10);
                        if (isNaN(j)) j = 0;
                        var m = b.config.indentOffset || 40;
                        j += ("indent" == i.name ? 1 : -1) * m;
                        if (j < 0) return false;
                        j = Math.max(j, 0);
                        j = Math.ceil(j / m) * m;
                        a.setStyle(g, j ? j + (b.config.indentUnit || "px") : "");
                        if ("" === a.getAttribute("style")) a.removeAttribute("style");
                    }
                    h.setMarker(k, a, "indent_processed", 1);
                    return true;
                }
                var q = b.getSelection(), r = q.createBookmarks(1), s = q && q.getRanges(1), t, u = s.createIterator();
                while (t = u.getNextRange()) {
                    var v = t.getCommonAncestor(), w = v;
                    while (w && !(1 == w.type && a[w.getName()])) w = w.getParent();
                    if (!w) {
                        var x = t.getEnclosedNode();
                        if (x && 1 == x.type && x.getName() in a) {
                            t.setStartAt(x, 1);
                            t.setEndAt(x, 2);
                            w = x;
                        }
                    }
                    if (w && 1 == t.startContainer.type && t.startContainer.getName() in a) {
                        var y = new d.walker(t);
                        y.evaluator = m;
                        t.startContainer = y.next();
                    }
                    if (w && 1 == t.endContainer.type && t.endContainer.getName() in a) {
                        y = new d.walker(t);
                        y.evaluator = m;
                        t.endContainer = y.previous();
                    }
                    if (w) {
                        var z = w.getFirst(m), A = !!z.getNext(m), B = t.startContainer, C = z.equals(B) || z.contains(B);
                        if (!(C && ("indent" == i.name || i.useIndentClasses || parseInt(w.getStyle(l(w)), 10)) && p(w, !A && z.getDirection()))) n(w);
                    } else o();
                }
                h.clearAllMarkers(k);
                b.forceNextSelectionCheck();
                q.selectBookmarks(r);
            }
        };
        j.add("indent", {
            init: function (a) {
                var c = a.addCommand("indent", new k(a, "indent")), f = a.addCommand("outdent", new k(a, "outdent"));
                a.ui.addButton("Indent", {
                    label: a.lang.indent,
                    command: "indent"
                });
                a.ui.addButton("Outdent", {
                    label: a.lang.outdent,
                    command: "outdent"
                });
                a.on("selectionChange", e.bind(i, c));
                a.on("selectionChange", e.bind(i, f));
                if (b.ie6Compat || b.ie7Compat) a.addCss("ul,ol{	margin-left: 0px;	padding-left: 40px;}");
                a.on("dirChanged", function (b) {
                    var c = new d.range(a.document);
                    c.setStartBefore(b.data.node);
                    c.setEndAfter(b.data.node);
                    var e = new d.walker(c), f;
                    while (f = e.next()) if (1 == f.type) {
                        if (!f.equals(b.data.node) && f.getDirection()) {
                            c.setStartAfter(f);
                            e = new d.walker(c);
                            continue;
                        }
                        var g = a.config.indentClasses;
                        if (g) {
                            var h = "ltr" == b.data.dir ? ["_rtl", ""] : ["", "_rtl"];
                            for (var i = 0; i < g.length; i++) if (f.hasClass(g[i] + h[0])) {
                                f.removeClass(g[i] + h[0]);
                                f.addClass(g[i] + h[1]);
                            }
                        }
                        var j = f.getStyle("margin-right"), k = f.getStyle("margin-left");
                        j ? f.setStyle("margin-left", j) : f.removeStyle("margin-left");
                        k ? f.setStyle("margin-right", k) : f.removeStyle("margin-right");
                    }
                });
            },
            requires: ["domiterator", "list"]
        });
    }();
    !function () {
        function a(a, b) {
            b = void 0 === b || b;
            var c;
            if (b) c = a.getComputedStyle("text-align"); else {
                while (!a.hasAttribute || !(a.hasAttribute("align") || a.getStyle("text-align"))) {
                    var d = a.getParent();
                    if (!d) break;
                    a = d;
                }
                c = a.getStyle("text-align") || a.getAttribute("align") || "";
            }
            c && (c = c.replace(/(?:-(?:moz|webkit)-)?(?:start|auto)/i, ""));
            !c && b && (c = "rtl" == a.getComputedStyle("direction") ? "right" : "left");
            return c;
        }
        function b(a) {
            if (a.editor.readOnly) return;
            a.editor.getCommand(this.name).refresh(a.data.path);
        }
        function c(a, b, c) {
            var d = this;
            d.editor = a;
            d.name = b;
            d.value = c;
            var e = a.config.justifyClasses;
            if (e) {
                switch (c) {
                    case "left":
                        d.cssClassName = e[0];
                        break;

                    case "center":
                        d.cssClassName = e[1];
                        break;

                    case "right":
                        d.cssClassName = e[2];
                        break;

                    case "justify":
                        d.cssClassName = e[3];
                }
                d.cssClassRegex = new RegExp("(?:^|\\s+)(?:" + e.join("|") + ")(?=$|\\s)");
            }
        }
        function f(a) {
            var b = a.editor, c = new d.range(b.document);
            c.setStartBefore(a.data.node);
            c.setEndAfter(a.data.node);
            var e = new d.walker(c), f;
            while (f = e.next()) if (1 == f.type) {
                if (!f.equals(a.data.node) && f.getDirection()) {
                    c.setStartAfter(f);
                    e = new d.walker(c);
                    continue;
                }
                var g = b.config.justifyClasses;
                if (g) if (f.hasClass(g[0])) {
                    f.removeClass(g[0]);
                    f.addClass(g[2]);
                } else if (f.hasClass(g[2])) {
                    f.removeClass(g[2]);
                    f.addClass(g[0]);
                }
                var h = "text-align", i = f.getStyle(h);
                if ("left" == i) f.setStyle(h, "right"); else if ("right" == i) f.setStyle(h, "left");
            }
        }
        c.prototype = {
            exec: function (b) {
                var c = this;
                var d = b.getSelection(), f = b.config.enterMode;
                if (!d) return;
                var g = d.createBookmarks(), h = d.getRanges(true), i = c.cssClassName, j, k, l = b.config.useComputedState;
                l = void 0 === l || l;
                for (var m = h.length - 1; m >= 0; m--) {
                    j = h[m].createIterator();
                    j.enlargeBr = 2 != f;
                    while (k = j.getNextParagraph(1 == f ? "p" : "div")) {
                        k.removeAttribute("align");
                        k.removeStyle("text-align");
                        var n = i && (k.$.className = e.ltrim(k.$.className.replace(c.cssClassRegex, ""))), o = 2 == c.state && (!l || a(k, true) != c.value);
                        if (i) {
                            if (o) k.addClass(i); else if (!n) k.removeAttribute("class");
                        } else if (o) k.setStyle("text-align", c.value);
                    }
                }
                b.focus();
                b.forceNextSelectionCheck();
                d.selectBookmarks(g);
            },
            refresh: function (b) {
                var c = b.block || b.blockLimit;
                this.setState("body" != c.getName() && a(c, this.editor.config.useComputedState) == this.value ? 1 : 2);
            }
        };
        j.add("justify", {
            init: function (a) {
                var d = new c(a, "justifyleft", "left"), g = new c(a, "justifycenter", "center"), h = new c(a, "justifyright", "right"), i = new c(a, "justifyblock", "justify");
                a.addCommand("justifyleft", d);
                a.addCommand("justifycenter", g);
                a.addCommand("justifyright", h);
                a.addCommand("justifyblock", i);
                a.ui.addButton("JustifyLeft", {
                    label: a.lang.justify.left,
                    command: "justifyleft"
                });
                a.ui.addButton("JustifyCenter", {
                    label: a.lang.justify.center,
                    command: "justifycenter"
                });
                a.ui.addButton("JustifyRight", {
                    label: a.lang.justify.right,
                    command: "justifyright"
                });
                a.ui.addButton("JustifyBlock", {
                    label: a.lang.justify.block,
                    command: "justifyblock"
                });
                a.on("selectionChange", e.bind(b, d));
                a.on("selectionChange", e.bind(b, h));
                a.on("selectionChange", e.bind(b, g));
                a.on("selectionChange", e.bind(b, i));
                a.on("dirChanged", f);
            },
            requires: ["domiterator"]
        });
    }();
    j.add("keystrokes", {
        beforeInit: function (b) {
            b.keystrokeHandler = new a.keystrokeHandler(b);
            b.specialKeys = {};
        },
        init: function (a) {
            var b = a.config.keystrokes, c = a.config.blockedKeystrokes, d = a.keystrokeHandler.keystrokes, e = a.keystrokeHandler.blockedKeystrokes;
            for (var f = 0; f < b.length; f++) d[b[f][0]] = b[f][1];
            for (f = 0; f < c.length; f++) e[c[f]] = 1;
        }
    });
    a.keystrokeHandler = function (a) {
        var b = this;
        if (a.keystrokeHandler) return a.keystrokeHandler;
        b.keystrokes = {};
        b.blockedKeystrokes = {};
        b._ = {
            editor: a
        };
        return b;
    };
    !function () {
        var c, d = function (a) {
            a = a.data;
            var b = a.getKeystroke(), d = this.keystrokes[b], e = this._.editor;
            c = true === e.fire("key", {
                keyCode: b
            });
            if (!c) {
                if (d) {
                    var f = {
                        from: "keystrokeHandler"
                    };
                    c = false !== e.execCommand(d, f);
                }
                if (!c) {
                    var g = e.specialKeys[b];
                    c = g && true === g(e);
                    if (!c) c = !!this.blockedKeystrokes[b];
                }
            }
            if (c) a.preventDefault(true);
            return !c;
        }, e = function (a) {
            if (c) {
                c = false;
                a.data.preventDefault(true);
            }
        };
        a.keystrokeHandler.prototype = {
            attach: function (a) {
                a.on("keydown", d, this);
                if (b.opera || b.gecko && b.mac) a.on("keypress", e, this);
            }
        };
    }();
    i.blockedKeystrokes = [1114112 + 66, 1114112 + 73, 1114112 + 85];
    i.keystrokes = [[4456448 + 121, "toolbarFocus"], [4456448 + 122, "elementsPathFocus"], [2228224 + 121, "contextMenu"], [1114112 + 2228224 + 121, "contextMenu"], [1114112 + 90, "undo"], [1114112 + 89, "redo"], [1114112 + 2228224 + 90, "redo"], [1114112 + 76, "link"], [1114112 + 66, "bold"], [1114112 + 73, "italic"], [1114112 + 85, "underline"], [4456448 + (c || b.webkit ? 189 : 109), "toolbarCollapse"], [4456448 + 48, "a11yHelp"]];
    j.add("link", {
        requires: ["fakeobjects", "dialog"],
        init: function (d) {
            d.addCommand("link", new a.dialogCommand("link"));
            d.addCommand("anchor", new a.dialogCommand("anchor"));
            d.addCommand("unlink", new a.unlinkCommand());
            d.addCommand("removeAnchor", new a.removeAnchorCommand());
            d.ui.addButton("Link", {
                label: d.lang.link.toolbar,
                command: "link"
            });
            d.ui.addButton("Unlink", {
                label: d.lang.unlink,
                command: "unlink"
            });
            d.ui.addButton("Anchor", {
                label: d.lang.anchor.toolbar,
                command: "anchor"
            });
            a.dialog.add("link", this.path + "dialogs/link.js");
            a.dialog.add("anchor", this.path + "dialogs/anchor.js");
            var e = "rtl" == d.lang.dir ? "right" : "left", f = "background:url(" + a.getUrl(this.path + "images/anchor.gif") + ") no-repeat " + e + " center;" + "border:1px dotted #00f;";
            d.addCss("a.cke_anchor,a.cke_anchor_empty" + (c && b.version < 7 ? "" : ",a[name],a[data-cke-saved-name]") + "{" + f + "padding-" + e + ":18px;" + "cursor:auto;" + "}" + (c ? "a.cke_anchor_empty{display:inline-block;}" : "") + "img.cke_anchor" + "{" + f + "width:16px;" + "min-height:15px;" + "height:1.15em;" + "vertical-align:" + (b.opera ? "middle" : "text-bottom") + ";" + "}");
            d.on("selectionChange", function (a) {
                if (d.readOnly) return;
                var b = d.getCommand("unlink"), c = a.data.path.lastElement && a.data.path.lastElement.getAscendant("a", true);
                if (c && "a" == c.getName() && c.getAttribute("href") && c.getChildCount()) b.setState(2); else b.setState(0);
            });
            d.on("doubleclick", function (a) {
                var b = j.link.getSelectedLink(d) || a.data.element;
                if (!b.isReadOnly()) if (b.is("a")) {
                    a.data.dialog = b.getAttribute("name") && (!b.getAttribute("href") || !b.getChildCount()) ? "anchor" : "link";
                    d.getSelection().selectElement(b);
                } else if (j.link.tryRestoreFakeAnchor(d, b)) a.data.dialog = "anchor";
            });
            if (d.addMenuItems) d.addMenuItems({
                anchor: {
                    label: d.lang.anchor.menu,
                    command: "anchor",
                    group: "anchor",
                    order: 1
                },
                removeAnchor: {
                    label: d.lang.anchor.remove,
                    command: "removeAnchor",
                    group: "anchor",
                    order: 5
                },
                link: {
                    label: d.lang.link.menu,
                    command: "link",
                    group: "link",
                    order: 1
                },
                unlink: {
                    label: d.lang.unlink,
                    command: "unlink",
                    group: "link",
                    order: 5
                }
            });
            if (d.contextMenu) d.contextMenu.addListener(function (a, b) {
                if (!a || a.isReadOnly()) return null;
                var c = j.link.tryRestoreFakeAnchor(d, a);
                if (!c && !(c = j.link.getSelectedLink(d))) return null;
                var e = {};
                if (c.getAttribute("href") && c.getChildCount()) e = {
                    link: 2,
                    unlink: 2
                };
                if (c && c.hasAttribute("name")) e.anchor = e.removeAnchor = 2;
                return e;
            });
        },
        afterInit: function (a) {
            var b = a.dataProcessor, c = b && b.dataFilter, d = b && b.htmlFilter, e = a._.elementsPath && a._.elementsPath.filters;
            if (c) c.addRules({
                elements: {
                    a: function (b) {
                        var c = b.attributes;
                        if (!c.name) return null;
                        var d = !b.children.length;
                        if (j.link.synAnchorSelector) {
                            var e = d ? "cke_anchor_empty" : "cke_anchor", f = c["class"];
                            if (c.name && (!f || f.indexOf(e) < 0)) c["class"] = (f || "") + " " + e;
                            if (d && j.link.emptyAnchorFix) {
                                c.contenteditable = "false";
                                c["data-cke-editable"] = 1;
                            }
                        } else if (j.link.fakeAnchor && d) return a.createFakeParserElement(b, "cke_anchor", "anchor");
                        return null;
                    }
                }
            });
            if (j.link.emptyAnchorFix && d) d.addRules({
                elements: {
                    a: function (a) {
                        delete a.attributes.contenteditable;
                    }
                }
            });
            if (e) e.push(function (b, c) {
                if ("a" == c) if (j.link.tryRestoreFakeAnchor(a, b) || b.getAttribute("name") && (!b.getAttribute("href") || !b.getChildCount())) return "anchor";
            });
        }
    });
    j.link = {
        getSelectedLink: function (a) {
            try {
                var b = a.getSelection();
                if (3 == b.getType()) {
                    var c = b.getSelectedElement();
                    if (c.is("a")) return c;
                }
                var d = b.getRanges(true)[0];
                d.shrink(2);
                var e = d.getCommonAncestor();
                return e.getAscendant("a", true);
            } catch (f) {
                return null;
            }
        },
        fakeAnchor: b.opera || b.webkit,
        synAnchorSelector: c,
        emptyAnchorFix: c && b.version < 8,
        tryRestoreFakeAnchor: function (a, b) {
            if (b && b.data("cke-real-element-type") && "anchor" == b.data("cke-real-element-type")) {
                var c = a.restoreRealElement(b);
                if (c.data("cke-saved-name")) return c;
            }
        }
    };
    a.unlinkCommand = function () { };
    a.unlinkCommand.prototype = {
        exec: function (a) {
            var b = a.getSelection(), c = b.createBookmarks(), d = b.getRanges(), e, f;
            for (var g = 0; g < d.length; g++) {
                e = d[g].getCommonAncestor(true);
                f = e.getAscendant("a", true);
                if (!f) continue;
                d[g].selectNodeContents(f);
            }
            b.selectRanges(d);
            a.document.$.execCommand("unlink", false, null);
            b.selectBookmarks(c);
        },
        startDisabled: true
    };
    a.removeAnchorCommand = function () { };
    a.removeAnchorCommand.prototype = {
        exec: function (a) {
            var b = a.getSelection(), c = b.createBookmarks(), d;
            if (b && (d = b.getSelectedElement()) && (j.link.fakeAnchor && !d.getChildCount() ? j.link.tryRestoreFakeAnchor(a, d) : d.is("a"))) d.remove(1); else if (d = j.link.getSelectedLink(a)) if (d.hasAttribute("href")) {
                d.removeAttributes({
                    name: 1,
                    "data-cke-saved-name": 1
                });
                d.removeClass("cke_anchor");
            } else d.remove(1);
            b.selectBookmarks(c);
        }
    };
    e.extend(i, {
        linkShowAdvancedTab: true,
        linkShowTargetTab: true
    });
    !function () {
        var b = {
            ol: 1,
            ul: 1
        }, g = /^[\n\r\t ]*$/, i = d.walker.whitespaces(), k = d.walker.bookmark(), l = function (a) {
            return !(i(a) || k(a));
        }, m = d.walker.bogus();
        function n(a) {
            var b, c, d;
            if (b = a.getDirection()) {
                c = a.getParent();
                while (c && !(d = c.getDirection())) c = c.getParent();
                if (b == d) a.removeAttribute("dir");
            }
        }
        function o(a, b) {
            var c = a.getAttribute("style");
            c && b.setAttribute("style", c.replace(/([^;])$/, "$1;") + (b.getAttribute("style") || ""));
        }
        j.list = {
            listToArray: function (a, c, d, e, g) {
                if (!b[a.getName()]) return [];
                if (!e) e = 0;
                if (!d) d = [];
                for (var i = 0, k = a.getChildCount(); i < k; i++) {
                    var l = a.getChild(i);
                    if (1 == l.type && l.getName() in f.$list) j.list.listToArray(l, c, d, e + 1);
                    if ("li" != l.$.nodeName.toLowerCase()) continue;
                    var m = {
                        parent: a,
                        indent: e,
                        element: l,
                        contents: []
                    };
                    if (!g) {
                        m.grandparent = a.getParent();
                        if (m.grandparent && "li" == m.grandparent.$.nodeName.toLowerCase()) m.grandparent = m.grandparent.getParent();
                    } else m.grandparent = g;
                    if (c) h.setMarker(c, l, "listarray_index", d.length);
                    d.push(m);
                    for (var n = 0, o = l.getChildCount(), p; n < o; n++) {
                        p = l.getChild(n);
                        if (1 == p.type && b[p.getName()]) j.list.listToArray(p, c, d, e + 1, m.grandparent); else m.contents.push(p);
                    }
                }
                return d;
            },
            arrayToList: function (a, e, g, i, k) {
                if (!g) g = 0;
                if (!a || a.length < g + 1) return null;
                var m, p = a[g].parent.getDocument(), q = new d.documentFragment(p), r = null, s = g, t = Math.max(a[g].indent, 0), u = null, v, w, x = 1 == i ? "p" : "div";
                while (1) {
                    var y = a[s], z = y.grandparent;
                    v = y.element.getDirection(1);
                    if (y.indent == t) {
                        if (!r || a[s].parent.getName() != r.getName()) {
                            r = a[s].parent.clone(false, 1);
                            k && r.setAttribute("dir", k);
                            q.append(r);
                        }
                        u = r.append(y.element.clone(0, 1));
                        if (v != r.getDirection(1)) u.setAttribute("dir", v);
                        for (m = 0; m < y.contents.length; m++) u.append(y.contents[m].clone(1, 1));
                        s++;
                    } else if (y.indent == Math.max(t, 0) + 1) {
                        var A = a[s - 1].element.getDirection(1), B = j.list.arrayToList(a, null, s, i, A != v ? v : null);
                        if (!u.getChildCount() && c && !(p.$.documentMode > 7)) u.append(p.createText(" "));
                        u.append(B.listNode);
                        s = B.nextIndex;
                    } else if (y.indent == -1 && !g && z) {
                        if (b[z.getName()]) {
                            u = y.element.clone(false, true);
                            if (v != z.getDirection(1)) u.setAttribute("dir", v);
                        } else u = new d.documentFragment(p);
                        var C = z.getDirection(1) != v, D = y.element, E = D.getAttribute("class"), F = D.getAttribute("style"), G = 11 == u.type && (2 != i || C || F || E), H, I = y.contents.length;
                        for (m = 0; m < I; m++) {
                            H = y.contents[m];
                            if (1 == H.type && H.isBlockBoundary()) {
                                if (C && !H.getDirection()) H.setAttribute("dir", v);
                                o(D, H);
                                E && H.addClass(E);
                            } else if (G) {
                                if (!w) {
                                    w = p.createElement(x);
                                    C && w.setAttribute("dir", v);
                                }
                                F && w.setAttribute("style", F);
                                E && w.setAttribute("class", E);
                                w.append(H.clone(1, 1));
                            }
                            u.append(w || H.clone(1, 1));
                        }
                        if (11 == u.type && s != a.length - 1) {
                            var J = u.getLast();
                            if (J && 1 == J.type && "_moz" == J.getAttribute("type")) J.remove();
                            if (!(J = u.getLast(l) && 1 == J.type && J.getName() in f.$block)) u.append(p.createElement("br"));
                        }
                        var K = u.$.nodeName.toLowerCase();
                        if (!c && ("div" == K || "p" == K)) u.appendBogus();
                        q.append(u);
                        r = null;
                        s++;
                    } else return null;
                    w = null;
                    if (a.length <= s || Math.max(a[s].indent, 0) < t) break;
                }
                if (e) {
                    var L = q.getFirst(), M = a[0].parent;
                    while (L) {
                        if (1 == L.type) {
                            h.clearMarkers(e, L);
                            if (L.getName() in f.$listItem) n(L);
                        }
                        L = L.getNextSourceNode();
                    }
                }
                return {
                    listNode: q,
                    nextIndex: s
                };
            }
        };
        function p(a) {
            if (a.editor.readOnly) return null;
            var c = a.data.path, d = c.blockLimit, e = c.elements, f, g;
            for (g = 0; g < e.length && (f = e[g]) && !f.equals(d); g++) if (b[e[g].getName()]) return this.setState(this.type == e[g].getName() ? 1 : 2);
            return this.setState(2);
        }
        function q(a, b, c, d) {
            var e = j.list.listToArray(b.root, c), f = [];
            for (var g = 0; g < b.contents.length; g++) {
                var i = b.contents[g];
                i = i.getAscendant("li", true);
                if (!i || i.getCustomData("list_item_processed")) continue;
                f.push(i);
                h.setMarker(c, i, "list_item_processed", true);
            }
            var k = b.root, l = k.getDocument(), m, n;
            for (g = 0; g < f.length; g++) {
                var o = f[g].getCustomData("listarray_index");
                m = e[o].parent;
                if (!m.is(this.type)) {
                    n = l.createElement(this.type);
                    m.copyAttributes(n, {
                        start: 1,
                        type: 1
                    });
                    n.removeStyle("list-style-type");
                    e[o].parent = n;
                }
            }
            var p = j.list.arrayToList(e, c, null, a.config.enterMode), q, r = p.listNode.getChildCount();
            for (g = 0; g < r && (q = p.listNode.getChild(g)); g++) if (q.getName() == this.type) d.push(q);
            p.listNode.replace(b.root);
        }
        var r = /^h[1-6]$/;
        function s(a, b, c) {
            var d = b.contents, e = b.root.getDocument(), f = [];
            if (1 == d.length && d[0].equals(b.root)) {
                var g = e.createElement("div");
                d[0].moveChildren && d[0].moveChildren(g);
                d[0].append(g);
                d[0] = g;
            }
            var h = b.contents[0].getParent();
            for (var i = 0; i < d.length; i++) h = h.getCommonAncestor(d[i].getParent());
            var j = a.config.useComputedState, k, l;
            j = void 0 === j || j;
            for (i = 0; i < d.length; i++) {
                var m = d[i], n;
                while (n = m.getParent()) {
                    if (n.equals(h)) {
                        f.push(m);
                        if (!l && m.getDirection()) l = 1;
                        var o = m.getDirection(j);
                        if (null !== k) if (k && k != o) k = null; else k = o;
                        break;
                    }
                    m = n;
                }
            }
            if (f.length < 1) return;
            var p = f[f.length - 1].getNext(), q = e.createElement(this.type);
            c.push(q);
            var s, t;
            while (f.length) {
                s = f.shift();
                t = e.createElement("li");
                if (s.is("pre") || r.test(s.getName())) s.appendTo(t); else {
                    s.copyAttributes(t);
                    if (k && s.getDirection()) {
                        t.removeStyle("direction");
                        t.removeAttribute("dir");
                    }
                    s.moveChildren(t);
                    s.remove();
                }
                t.appendTo(q);
            }
            if (k && l) q.setAttribute("dir", k);
            if (p) q.insertBefore(p); else q.appendTo(h);
        }
        function t(a, b, c) {
            var e = j.list.listToArray(b.root, c), f = [];
            for (var g = 0; g < b.contents.length; g++) {
                var i = b.contents[g];
                i = i.getAscendant("li", true);
                if (!i || i.getCustomData("list_item_processed")) continue;
                f.push(i);
                h.setMarker(c, i, "list_item_processed", true);
            }
            var k = null;
            for (g = 0; g < f.length; g++) {
                var l = f[g].getCustomData("listarray_index");
                e[l].indent = -1;
                k = l;
            }
            for (g = k + 1; g < e.length; g++) if (e[g].indent > e[g - 1].indent + 1) {
                var m = e[g - 1].indent + 1 - e[g].indent, n = e[g].indent;
                while (e[g] && e[g].indent >= n) {
                    e[g].indent += m;
                    g++;
                }
                g--;
            }
            var o = j.list.arrayToList(e, c, null, a.config.enterMode, b.root.getAttribute("dir")), p = o.listNode, q, r;
            function s(c) {
                if ((q = p[c ? "getFirst" : "getLast"]()) && !(q.is && q.isBlockBoundary()) && (r = b.root[c ? "getPrevious" : "getNext"](d.walker.whitespaces(true))) && !(r.is && r.isBlockBoundary({
                    br: 1
                }))) a.document.createElement("br")[c ? "insertBefore" : "insertAfter"](q);
            }
            s(true);
            s();
            p.replace(b.root);
        }
        function u(a, b) {
            this.name = a;
            this.type = b;
        }
        var v = d.walker.nodeType(1);
        function w(a, b, c, d) {
            var e, f;
            while (e = a[d ? "getLast" : "getFirst"](v)) {
                if ((f = e.getDirection(1)) !== b.getDirection(1)) e.setAttribute("dir", f);
                e.remove();
                c ? e[d ? "insertBefore" : "insertAfter"](c) : b.append(e, d);
            }
        }
        u.prototype = {
            exec: function (a) {
                var c = this;
                var e = a.document, f = a.config, g = a.getSelection(), i = g && g.getRanges(true);
                if (!i || i.length < 1) return;
                if (2 == c.state) {
                    var j = e.getBody();
                    if (!j.getFirst(l)) {
                        2 == f.enterMode ? j.appendBogus() : i[0].fixBlock(1, 1 == f.enterMode ? "p" : "div");
                        g.selectRanges(i);
                    } else {
                        var k = 1 == i.length && i[0], m = k && k.getEnclosedNode();
                        if (m && m.is && c.type == m.getName()) c.setState(1);
                    }
                }
                var n = g.createBookmarks(true), o = [], p = {}, r = i.createIterator(), u = 0;
                while ((k = r.getNextRange()) && ++u) {
                    var v = k.getBoundaryNodes(), w = v.startNode, y = v.endNode;
                    if (1 == w.type && "td" == w.getName()) k.setStartAt(v.startNode, 1);
                    if (1 == y.type && "td" == y.getName()) k.setEndAt(v.endNode, 2);
                    var z = k.createIterator(), A;
                    z.forceBrBreak = 2 == c.state;
                    while (A = z.getNextParagraph()) {
                        if (A.getCustomData("list_block")) continue; else h.setMarker(p, A, "list_block", 1);
                        var B = new d.elementPath(A), C = B.elements, D = C.length, E = null, F = 0, G = B.blockLimit, H;
                        for (var I = D - 1; I >= 0 && (H = C[I]); I--) if (b[H.getName()] && G.contains(H)) {
                            G.removeCustomData("list_group_object_" + u);
                            var J = H.getCustomData("list_group_object");
                            if (J) J.contents.push(A); else {
                                J = {
                                    root: H,
                                    contents: [A]
                                };
                                o.push(J);
                                h.setMarker(p, H, "list_group_object", J);
                            }
                            F = 1;
                            break;
                        }
                        if (F) continue;
                        var K = G;
                        if (K.getCustomData("list_group_object_" + u)) K.getCustomData("list_group_object_" + u).contents.push(A); else {
                            J = {
                                root: K,
                                contents: [A]
                            };
                            h.setMarker(p, K, "list_group_object_" + u, J);
                            o.push(J);
                        }
                    }
                }
                var L = [];
                while (o.length > 0) {
                    J = o.shift();
                    if (2 == c.state) if (b[J.root.getName()]) q.call(c, a, J, p, L); else s.call(c, a, J, L); else if (1 == c.state && b[J.root.getName()]) t.call(c, a, J, p);
                }
                for (I = 0; I < L.length; I++) x(L[I]);
                h.clearAllMarkers(p);
                g.selectBookmarks(n);
                a.focus();
            }
        };
        function x(a) {
            var b;
            (b = function (b) {
                var c = a[b ? "getPrevious" : "getNext"](l);
                if (c && 1 == c.type && c.is(a.getName())) {
                    w(a, c, null, !b);
                    a.remove();
                    a = c;
                }
            })();
            b(1);
        }
        var y = f, z = /[\t\r\n ]*(?:&nbsp;|\xa0)$/;
        function A(a, b) {
            var c, d = a.children, e = d.length;
            for (var f = 0; f < e; f++) {
                c = d[f];
                if (c.name && c.name in b) return f;
            }
            return e;
        }
        function B(b) {
            return function (d) {
                var e = d.children, f = A(d, y.$list), g = e[f], h = g && g.previous, i;
                if (h && (h.name && "br" == h.name || h.value && (i = h.value.match(z)))) {
                    var j = h;
                    if (!(i && i.index) && j == e[0]) e[0] = b || c ? new a.htmlParser.text(" ") : new a.htmlParser.element("br", {}); else if ("br" == j.name) e.splice(f - 1, 1); else j.value = j.value.replace(z, "");
                }
            };
        }
        var C = {
            elements: {}
        };
        for (var D in y.$listItem) C.elements[D] = B();
        var E = {
            elements: {}
        };
        for (D in y.$listItem) E.elements[D] = B(true);
        function F(a) {
            return 1 == a.type && (a.getName() in f.$block || a.getName() in f.$listItem) && f[a.getName()]["#"];
        }
        function G(a, b, c) {
            a.fire("saveSnapshot");
            c.enlarge(3);
            var e = c.extractContents();
            b.trim(false, true);
            var g = b.createBookmark(), h = new d.elementPath(b.startContainer), i = h.block, j = h.lastElement.getAscendant("li", 1) || i, k = new d.elementPath(c.startContainer), n = k.contains(f.$listItem), o = k.contains(f.$list), p;
            if (i) {
                var q = i.getBogus();
                q && q.remove();
            } else if (o) {
                p = o.getPrevious(l);
                if (p && m(p)) p.remove();
            }
            p = e.getLast();
            if (p && 1 == p.type && p.is("br")) p.remove();
            var r = b.startContainer.getChild(b.startOffset);
            if (r) e.insertBefore(r); else b.startContainer.append(e);
            if (n) {
                var s = H(n);
                if (s) if (j.contains(n)) {
                    w(s, n.getParent(), n);
                    s.remove();
                } else j.append(s);
            }
            while (c.checkStartOfBlock() && c.checkEndOfBlock()) {
                k = new d.elementPath(c.startContainer);
                var t = k.block, u;
                if (t.is("li")) {
                    u = t.getParent();
                    if (t.equals(u.getLast(l)) && t.equals(u.getFirst(l))) t = u;
                }
                c.moveToPosition(t, 3);
                t.remove();
            }
            var v = c.clone(), y = a.document.getBody();
            v.setEndAt(y, 2);
            var z = new d.walker(v);
            z.evaluator = function (a) {
                return l(a) && !m(a);
            };
            var A = z.next();
            if (A && 1 == A.type && A.getName() in f.$list) x(A);
            b.moveToBookmark(g);
            b.select();
            a.selectionChange(1);
            a.fire("saveSnapshot");
        }
        function H(a) {
            var c = a.getLast(l);
            return c && 1 == c.type && c.getName() in b ? c : null;
        }
        j.add("list", {
            init: function (a) {
                var c = a.addCommand("numberedlist", new u("numberedlist", "ol")), f = a.addCommand("bulletedlist", new u("bulletedlist", "ul"));
                a.ui.addButton("NumberedList", {
                    label: a.lang.numberedlist,
                    command: "numberedlist"
                });
                a.ui.addButton("BulletedList", {
                    label: a.lang.bulletedlist,
                    command: "bulletedlist"
                });
                a.on("selectionChange", e.bind(p, c));
                a.on("selectionChange", e.bind(p, f));
                a.on("key", function (c) {
                    var e = c.data.keyCode;
                    if ("wysiwyg" == a.mode && e in {
                        8: 1,
                        46: 1
                    }) {
                        var f = a.getSelection(), g = f.getRanges()[0];
                        if (!g.collapsed) return;
                        var h = new d.elementPath(g.startContainer), i = 8 == e, j = a.document.getBody(), k = new d.walker(g.clone());
                        k.evaluator = function (a) {
                            return l(a) && !m(a);
                        };
                        k.guard = function (a, b) {
                            return !(b && 1 == a.type && a.is("table"));
                        };
                        var n = g.clone();
                        if (i) {
                            var o, p;
                            if ((o = h.contains(b)) && g.checkBoundaryOfElement(o, 1) && (o = o.getParent()) && o.is("li") && (o = H(o))) {
                                p = o;
                                o = o.getPrevious(l);
                                n.moveToPosition(o && m(o) ? o : p, 3);
                            } else {
                                k.range.setStartAt(j, 1);
                                k.range.setEnd(g.startContainer, g.startOffset);
                                o = k.previous();
                                if (o && 1 == o.type && (o.getName() in b || o.is("li"))) {
                                    if (!o.is("li")) {
                                        k.range.selectNodeContents(o);
                                        k.reset();
                                        k.evaluator = F;
                                        o = k.previous();
                                    }
                                    p = o;
                                    n.moveToElementEditEnd(p);
                                }
                            }
                            if (p) {
                                G(a, n, g);
                                c.cancel();
                            } else {
                                var q = h.contains(b), r;
                                if (q && g.checkBoundaryOfElement(q, 1)) {
                                    r = q.getFirst(l);
                                    if (g.checkBoundaryOfElement(r, 1)) {
                                        o = q.getPrevious(l);
                                        if (H(r)) {
                                            if (o) {
                                                g.moveToElementEditEnd(o);
                                                g.select();
                                            }
                                            c.cancel();
                                        } else {
                                            a.execCommand("outdent");
                                            c.cancel();
                                        }
                                    }
                                }
                            }
                        } else {
                            var s, t;
                            r = g.startContainer.getAscendant("li", 1);
                            if (r) {
                                k.range.setEndAt(j, 2);
                                var u = r.getLast(l), v = u && F(u) ? u : r, w = 0;
                                s = k.next();
                                if (s && 1 == s.type && s.getName() in b && s.equals(u)) {
                                    w = 1;
                                    s = k.next();
                                } else if (g.checkBoundaryOfElement(v, 2)) w = 1;
                                if (w && s) {
                                    t = g.clone();
                                    t.moveToElementEditStart(s);
                                    G(a, n, t);
                                    c.cancel();
                                }
                            } else {
                                k.range.setEndAt(j, 2);
                                s = k.next();
                                if (s && 1 == s.type && s.getName() in b) {
                                    s = s.getFirst(l);
                                    if (h.block && g.checkStartOfBlock() && g.checkEndOfBlock()) {
                                        h.block.remove();
                                        g.moveToElementEditStart(s);
                                        g.select();
                                        c.cancel();
                                    } else if (H(s)) {
                                        g.moveToElementEditStart(s);
                                        g.select();
                                        c.cancel();
                                    } else {
                                        t = g.clone();
                                        t.moveToElementEditStart(s);
                                        G(a, n, t);
                                        c.cancel();
                                    }
                                }
                            }
                        }
                        setTimeout(function () {
                            a.selectionChange(1);
                        });
                    }
                });
            },
            afterInit: function (a) {
                var b = a.dataProcessor;
                if (b) {
                    b.dataFilter.addRules(C);
                    b.htmlFilter.addRules(E);
                }
            },
            requires: ["domiterator"]
        });
    }();
    !function () {
        j.liststyle = {
            requires: ["dialog"],
            init: function (b) {
                b.addCommand("numberedListStyle", new a.dialogCommand("numberedListStyle"));
                a.dialog.add("numberedListStyle", this.path + "dialogs/liststyle.js");
                b.addCommand("bulletedListStyle", new a.dialogCommand("bulletedListStyle"));
                a.dialog.add("bulletedListStyle", this.path + "dialogs/liststyle.js");
                if (b.addMenuItems) {
                    b.addMenuGroup("list", 108);
                    b.addMenuItems({
                        numberedlist: {
                            label: b.lang.list.numberedTitle,
                            group: "list",
                            command: "numberedListStyle"
                        },
                        bulletedlist: {
                            label: b.lang.list.bulletedTitle,
                            group: "list",
                            command: "bulletedListStyle"
                        }
                    });
                }
                if (b.contextMenu) b.contextMenu.addListener(function (a, b) {
                    if (!a || a.isReadOnly()) return null;
                    while (a) {
                        var c = a.getName();
                        if ("ol" == c) return {
                            numberedlist: 2
                        }; else if ("ul" == c) return {
                            bulletedlist: 2
                        };
                        a = a.getParent();
                    }
                    return null;
                });
            }
        };
        j.add("liststyle", j.liststyle);
    }();
    !function () {
        function d(a) {
            if (!a || 1 != a.type || "form" != a.getName()) return [];
            var b = [], c = ["style", "className"];
            for (var d = 0; d < c.length; d++) {
                var e = c[d], f = a.$.elements.namedItem(e);
                if (f) {
                    var g = new h(f);
                    b.push([g, g.nextSibling]);
                    g.remove();
                }
            }
            return b;
        }
        function e(a, b) {
            if (!a || 1 != a.type || "form" != a.getName()) return;
            if (b.length > 0) for (var c = b.length - 1; c >= 0; c--) {
                var d = b[c][0], e = b[c][1];
                if (e) d.insertBefore(e); else d.appendTo(a);
            }
        }
        function f(a, b) {
            var c = d(a), f = {}, g = a.$;
            if (!b) {
                f["class"] = g.className || "";
                g.className = "";
            }
            f.inline = g.style.cssText || "";
            if (!b) g.style.cssText = "position: static; overflow: visible";
            e(c);
            return f;
        }
        function g(a, b) {
            var c = d(a), f = a.$;
            if ("class" in b) f.className = b["class"];
            if ("inline" in b) f.style.cssText = b.inline;
            e(c);
        }
        function i(b) {
            var c = a.instances;
            for (var d in c) {
                var e = c[d];
                if ("wysiwyg" == e.mode && !e.readOnly) {
                    var f = e.document.getBody();
                    f.setAttribute("contentEditable", false);
                    f.setAttribute("contentEditable", true);
                }
            }
            if (b.focusManager.hasFocus) {
                b.toolbox.focus();
                b.focus();
            }
        }
        function k(a) {
            if (!c || b.version > 6) return null;
            var d = h.createFromHtml('<iframe frameborder="0" tabindex="-1" src="javascript:void((function(){document.open();' + (b.isCustomDomain() ? "document.domain='" + this.getDocument().$.domain + "';" : "") + "document.close();" + '})())"' + ' style="display:block;position:absolute;z-index:-1;' + "progid:DXImageTransform.Microsoft.Alpha(opacity=0);" + '"></iframe>');
            return a.append(d, true);
        }
        j.add("maximize", {
            init: function (d) {
                var e = d.lang, h = a.document, j = h.getWindow(), l, m, n, o;
                function p() {
                    var a = j.getViewPaneSize();
                    o && o.setStyles({
                        width: a.width + "px",
                        height: a.height + "px"
                    });
                    d.resize(a.width, a.height, null, true);
                }
                var q = 2;
                d.addCommand("maximize", {
                    modes: {
                        wysiwyg: !b.iOS,
                        source: !b.iOS
                    },
                    readOnly: 1,
                    editorFocus: false,
                    exec: function () {
                        var a = d.container.getChild(1), r = d.getThemeSpace("contents");
                        if ("wysiwyg" == d.mode) {
                            var s = d.getSelection();
                            l = s && s.getRanges();
                            m = j.getScrollPosition();
                        } else {
                            var t = d.textarea.$;
                            l = !c && [t.selectionStart, t.selectionEnd];
                            m = [t.scrollLeft, t.scrollTop];
                        }
                        if (2 == this.state) {
                            j.on("resize", p);
                            n = j.getScrollPosition();
                            var u = d.container;
                            while (u = u.getParent()) {
                                u.setCustomData("maximize_saved_styles", f(u));
                                u.setStyle("z-index", d.config.baseFloatZIndex - 1);
                            }
                            r.setCustomData("maximize_saved_styles", f(r, true));
                            a.setCustomData("maximize_saved_styles", f(a, true));
                            var v = {
                                overflow: b.webkit ? "" : "hidden",
                                width: 0,
                                height: 0
                            };
                            h.getDocumentElement().setStyles(v);
                            !b.gecko && h.getDocumentElement().setStyle("position", "fixed");
                            !(b.gecko && b.quirks) && h.getBody().setStyles(v);
                            c ? setTimeout(function () {
                                j.$.scrollTo(0, 0);
                            }, 0) : j.$.scrollTo(0, 0);
                            a.setStyle("position", b.gecko && b.quirks ? "fixed" : "absolute");
                            a.$.offsetLeft;
                            a.setStyles({
                                "z-index": d.config.baseFloatZIndex - 1,
                                left: "0px",
                                top: "0px"
                            });
                            o = k(a);
                            a.addClass("cke_maximized");
                            p();
                            var w = a.getDocumentPosition();
                            a.setStyles({
                                left: -1 * w.x + "px",
                                top: -1 * w.y + "px"
                            });
                            b.gecko && i(d);
                        } else if (1 == this.state) {
                            j.removeListener("resize", p);
                            var x = [r, a];
                            for (var y = 0; y < x.length; y++) {
                                g(x[y], x[y].getCustomData("maximize_saved_styles"));
                                x[y].removeCustomData("maximize_saved_styles");
                            }
                            u = d.container;
                            while (u = u.getParent()) {
                                g(u, u.getCustomData("maximize_saved_styles"));
                                u.removeCustomData("maximize_saved_styles");
                            }
                            c ? setTimeout(function () {
                                j.$.scrollTo(n.x, n.y);
                            }, 0) : j.$.scrollTo(n.x, n.y);
                            a.removeClass("cke_maximized");
                            if (b.webkit) {
                                a.setStyle("display", "inline");
                                setTimeout(function () {
                                    a.setStyle("display", "block");
                                }, 0);
                            }
                            if (o) {
                                o.remove();
                                o = null;
                            }
                            d.fire("resize");
                        }
                        this.toggleState();
                        var z = this.uiItems[0];
                        if (z) {
                            var A = 2 == this.state ? e.maximize : e.minimize, B = d.element.getDocument().getById(z._.id);
                            B.getChild(1).setHtml(A);
                            B.setAttribute("title", A);
                            B.setAttribute("href", 'javascript:void("' + A + '");');
                        }
                        if ("wysiwyg" == d.mode) if (l) {
                            b.gecko && i(d);
                            d.getSelection().selectRanges(l);
                            var C = d.getSelection().getStartElement();
                            C && C.scrollIntoView(true);
                        } else j.$.scrollTo(m.x, m.y); else {
                            if (l) {
                                t.selectionStart = l[0];
                                t.selectionEnd = l[1];
                            }
                            t.scrollLeft = m[0];
                            t.scrollTop = m[1];
                        }
                        l = m = null;
                        q = this.state;
                    },
                    canUndo: false
                });
                d.ui.addButton("Maximize", {
                    label: e.maximize,
                    command: "maximize"
                });
                d.on("mode", function () {
                    var a = d.getCommand("maximize");
                    a.setState(0 == a.state ? 0 : q);
                }, null, null, 100);
            }
        });
    }();
    j.add("newpage", {
        init: function (a) {
            a.addCommand("newpage", {
                modes: {
                    wysiwyg: 1,
                    source: 1
                },
                exec: function (a) {
                    var b = this;
                    a.setData(a.config.newpage_html || "", function () {
                        setTimeout(function () {
                            a.fire("afterCommandExec", {
                                name: "newpage",
                                command: b
                            });
                            a.selectionChange();
                        }, 200);
                    });
                    a.focus();
                },
                async: true
            });
            a.ui.addButton("NewPage", {
                label: a.lang.newPage,
                command: "newpage"
            });
        }
    });
    j.add("pagebreak", {
        init: function (c) {
            c.addCommand("pagebreak", j.pagebreakCmd);
            c.ui.addButton("PageBreak", {
                label: c.lang.pagebreak,
                command: "pagebreak"
            });
            var d = ["{", "background: url(" + a.getUrl(this.path + "images/pagebreak.gif") + ") no-repeat center center;", "clear: both;", "width:100%; _width:99.9%;", "border-top: #999999 1px dotted;", "border-bottom: #999999 1px dotted;", "padding:0;", "height: 5px;", "cursor: default;", "}"].join("").replace(/;/g, " !important;");
            c.addCss("div.cke_pagebreak" + d);
            b.opera && c.on("contentDom", function () {
                c.document.on("click", function (a) {
                    var b = a.data.getTarget();
                    if (b.is("div") && b.hasClass("cke_pagebreak")) c.getSelection().selectElement(b);
                });
            });
        },
        afterInit: function (b) {
            var c = b.lang.pagebreakAlt, d = b.dataProcessor, e = d && d.dataFilter, f = d && d.htmlFilter;
            if (f) f.addRules({
                attributes: {
                    "class": function (b, c) {
                        var d = b.replace("cke_pagebreak", "");
                        if (d != b) {
                            var e = a.htmlParser.fragment.fromHtml('<span style="display: none;">&nbsp;</span>');
                            c.children.length = 0;
                            c.add(e);
                            var f = c.attributes;
                            delete f["aria-label"];
                            delete f.contenteditable;
                            delete f.title;
                        }
                        return d;
                    }
                }
            }, 5);
            if (e) e.addRules({
                elements: {
                    div: function (a) {
                        var b = a.attributes, d = b && b.style, e = d && 1 == a.children.length && a.children[0], f = e && "span" == e.name && e.attributes.style;
                        if (f && /page-break-after\s*:\s*always/i.test(d) && /display\s*:\s*none/i.test(f)) {
                            b.contenteditable = "false";
                            b["class"] = "cke_pagebreak";
                            b["data-cke-display-name"] = "pagebreak";
                            b["aria-label"] = c;
                            b.title = c;
                            a.children.length = 0;
                        }
                    }
                }
            });
        },
        requires: ["fakeobjects"]
    });
    j.pagebreakCmd = {
        exec: function (a) {
            var b = a.lang.pagebreakAlt, c = h.createFromHtml('<div style="page-break-after: always;"contenteditable="false" title="' + b + '" ' + 'aria-label="' + b + '" ' + 'data-cke-display-name="pagebreak" ' + 'class="cke_pagebreak">' + "</div>", a.document), d = a.getSelection().getRanges(true);
            a.fire("saveSnapshot");
            for (var e, f = d.length - 1; f >= 0; f--) {
                e = d[f];
                if (f < d.length - 1) c = c.clone(true);
                e.splitBlock("p");
                e.insertNode(c);
                if (f == d.length - 1) {
                    var g = c.getNext();
                    e.moveToPosition(c, 4);
                    if (!g || 1 == g.type && !g.isEditable()) e.fixBlock(true, 3 == a.config.enterMode ? "div" : "p");
                    e.select();
                }
            }
            a.fire("saveSnapshot");
        }
    };
    !function () {
        function b(a) {
            a.data.mode = "html";
        }
        j.add("pastefromword", {
            init: function (c) {
                var d = 0, e = function (a) {
                    a && a.removeListener();
                    c.removeListener("beforePaste", b);
                    d && setTimeout(function () {
                        d = 0;
                    }, 0);
                };
                c.addCommand("pastefromword", {
                    canUndo: false,
                    exec: function () {
                        d = 1;
                        c.on("beforePaste", b);
                        if (false === c.execCommand("paste", "html")) {
                            c.on("dialogShow", function (a) {
                                a.removeListener();
                                a.data.on("cancel", e);
                            });
                            c.on("dialogHide", function (a) {
                                a.data.removeListener("cancel", e);
                            });
                        }
                        c.on("afterPaste", e);
                    }
                });
                c.ui.addButton("PasteFromWord", {
                    label: c.lang.pastefromword.toolbar,
                    command: "pastefromword"
                });
                c.on("pasteState", function (a) {
                    c.getCommand("pastefromword").setState(a.data);
                });
                c.on("paste", function (b) {
                    var e = b.data, f;
                    if ((f = e.html) && (d || /(class=\"?Mso|style=\"[^\"]*\bmso\-|w:WordDocument)/.test(f))) {
                        var g = this.loadFilterRules(function () {
                            if (g) c.fire("paste", e); else if (!c.config.pasteFromWordPromptCleanup || d || confirm(c.lang.pastefromword.confirmCleanup)) e.html = a.cleanWord(f, c);
                        });
                        g && b.cancel();
                    }
                }, this);
            },
            loadFilterRules: function (b) {
                var c = a.cleanWord;
                if (c) b(); else {
                    var d = a.getUrl(i.pasteFromWordCleanupFile || this.path + "filter/default.js");
                    a.scriptLoader.load(d, b, null, true);
                }
                return !c;
            },
            requires: ["clipboard"]
        });
    }();
    !function () {
        var b = {
            exec: function (a) {
                var b = e.tryThese(function () {
                    var a = window.clipboardData.getData("Text");
                    if (!a) throw 0;
                    return a;
                });
                if (!b) {
                    a.openDialog("pastetext");
                    return false;
                } else a.fire("paste", {
                    text: b
                });
                return true;
            }
        };
        j.add("pastetext", {
            init: function (c) {
                var d = "pastetext", e = c.addCommand(d, b);
                c.ui.addButton("PasteText", {
                    label: c.lang.pasteText.button,
                    command: d
                });
                a.dialog.add(d, a.getUrl(this.path + "dialogs/pastetext.js"));
                if (c.config.forcePasteAsPlainText) {
                    c.on("beforeCommandExec", function (a) {
                        var b = a.data.commandData;
                        if ("paste" == a.data.name && "html" != b) {
                            c.execCommand("pastetext");
                            a.cancel();
                        }
                    }, null, null, 0);
                    c.on("beforePaste", function (a) {
                        a.data.mode = "text";
                    });
                }
                c.on("pasteState", function (a) {
                    c.getCommand("pastetext").setState(a.data);
                });
            },
            requires: ["clipboard"]
        });
    }();
    j.add("popup");
    e.extend(a.editor.prototype, {
        popup: function (a, b, c, d) {
            b = b || "80%";
            c = c || "70%";
            if ("string" == typeof b && b.length > 1 && "%" == b.substr(b.length - 1, 1)) b = parseInt(window.screen.width * parseInt(b, 10) / 100, 10);
            if ("string" == typeof c && c.length > 1 && "%" == c.substr(c.length - 1, 1)) c = parseInt(window.screen.height * parseInt(c, 10) / 100, 10);
            if (b < 640) b = 640;
            if (c < 420) c = 420;
            var e = parseInt((window.screen.height - c) / 2, 10), f = parseInt((window.screen.width - b) / 2, 10);
            d = (d || "location=no,menubar=no,toolbar=no,dependent=yes,minimizable=no,modal=yes,alwaysRaised=yes,resizable=yes,scrollbars=yes") + ",width=" + b + ",height=" + c + ",top=" + e + ",left=" + f;
            var g = window.open("", null, d, true);
            if (!g) return false;
            try {
                var h = navigator.userAgent.toLowerCase();
                if (h.indexOf(" chrome/") == -1) {
                    g.moveTo(f, e);
                    g.resizeTo(b, c);
                }
                g.focus();
                g.location.href = a;
            } catch (i) {
                g = window.open(a, null, d, true);
            }
            return true;
        }
    });
    !function () {
        var a, c = {
            modes: {
                wysiwyg: 1,
                source: 1
            },
            canUndo: false,
            readOnly: 1,
            exec: function (c) {
                var d, f = c.config, g = f.baseHref ? '<base href="' + f.baseHref + '"/>' : "", h = b.isCustomDomain();
                if (f.fullPage) d = c.getData().replace(/<head>/, "$&" + g).replace(/[^>]*(?=<\/title>)/, "$& &mdash; " + c.lang.preview); else {
                    var i = "<body ", j = c.document && c.document.getBody();
                    if (j) {
                        if (j.getAttribute("id")) i += 'id="' + j.getAttribute("id") + '" ';
                        if (j.getAttribute("class")) i += 'class="' + j.getAttribute("class") + '" ';
                    }
                    i += ">";
                    d = c.config.docType + '<html dir="' + c.config.contentsLangDirection + '">' + "<head>" + g + "<title>" + c.lang.preview + "</title>" + e.buildStyleHtml(c.config.contentsCss) + "</head>" + i + c.getData() + "</body></html>";
                }
                var k = 640, l = 420, m = 80;
                try {
                    var n = window.screen;
                    k = Math.round(.8 * n.width);
                    l = Math.round(.7 * n.height);
                    m = Math.round(.1 * n.width);
                } catch (o) { }
                var p = "";
                if (h) {
                    window._cke_htmlToLoad = d;
                    p = 'javascript:void( (function(){document.open();document.domain="' + document.domain + '";' + "document.write( window.opener._cke_htmlToLoad );" + "document.close();" + "window.opener._cke_htmlToLoad = null;" + "})() )";
                }
                if (b.gecko) {
                    window._cke_htmlToLoad = d;
                    p = a + "preview.html";
                }
                var q = window.open(p, null, "toolbar=yes,location=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=" + k + ",height=" + l + ",left=" + m);
                if (!h && !b.gecko) {
                    var r = q.document;
                    r.open();
                    r.write(d);
                    r.close();
                    b.webkit && setTimeout(function () {
                        r.body.innerHTML += "";
                    }, 0);
                }
            }
        }, d = "preview";
        j.add(d, {
            init: function (b) {
                a = this.path;
                b.addCommand(d, c);
                b.ui.addButton("Preview", {
                    label: b.lang.preview,
                    command: d
                });
            }
        });
    }();
    j.add("print", {
        init: function (a) {
            var b = "print", c = a.addCommand(b, j.print);
            a.ui.addButton("Print", {
                label: a.lang.print,
                command: b
            });
        }
    });
    j.print = {
        exec: function (a) {
            if (b.opera) return; else if (b.gecko) a.window.$.print(); else a.document.$.execCommand("Print");
        },
        canUndo: false,
        readOnly: 1,
        modes: {
            wysiwyg: !b.opera
        }
    };
    j.add("removeformat", {
        requires: ["selection"],
        init: function (a) {
            a.addCommand("removeFormat", j.removeformat.commands.removeformat);
            a.ui.addButton("RemoveFormat", {
                label: a.lang.removeFormat,
                command: "removeFormat"
            });
            a._.removeFormat = {
                filters: []
            };
        }
    });
    j.removeformat = {
        commands: {
            removeformat: {
                exec: function (a) {
                    var b = a._.removeFormatRegex || (a._.removeFormatRegex = new RegExp("^(?:" + a.config.removeFormatTags.replace(/,/g, "|") + ")$", "i")), c = a._.removeAttributes || (a._.removeAttributes = a.config.removeFormatAttributes.split(",")), e = j.removeformat.filter, f = a.getSelection().getRanges(1), g = f.createIterator(), h;
                    while (h = g.getNextRange()) {
                        if (!h.collapsed) h.enlarge(1);
                        var i = h.createBookmark(), k = i.startNode, l = i.endNode, m, n = function (c) {
                            var f = new d.elementPath(c), g = f.elements;
                            for (var h = 1, i; i = g[h]; h++) {
                                if (i.equals(f.block) || i.equals(f.blockLimit)) break;
                                if (b.test(i.getName()) && e(a, i)) c.breakParent(i);
                            }
                        };
                        n(k);
                        if (l) {
                            n(l);
                            m = k.getNextSourceNode(true, 1);
                            while (m) {
                                if (m.equals(l)) break;
                                var o = m.getNextSourceNode(false, 1);
                                if (!("img" == m.getName() && m.data("cke-realelement")) && e(a, m)) if (b.test(m.getName())) m.remove(1); else {
                                    m.removeAttributes(c);
                                    a.fire("removeFormatCleanup", m);
                                }
                                m = o;
                            }
                        }
                        h.moveToBookmark(i);
                    }
                    a.getSelection().selectRanges(f);
                }
            }
        },
        filter: function (a, b) {
            var c = a._.removeFormat.filters;
            for (var d = 0; d < c.length; d++) if (false === c[d](b)) return false;
            return true;
        }
    };
    a.editor.prototype.addRemoveFormatFilter = function (a) {
        this._.removeFormat.filters.push(a);
    };
    i.removeFormatTags = "b,big,code,del,dfn,em,font,i,ins,kbd,q,samp,small,span,strike,strong,sub,sup,tt,u,var";
    i.removeFormatAttributes = "class,style,lang,width,height,align,hspace,valign";
    j.add("resize", {
        init: function (b) {
            var c = b.config, d = b.element.getDirection(1);
            !c.resize_dir && (c.resize_dir = "both");
            void 0 == c.resize_maxWidth && (c.resize_maxWidth = 3e3);
            void 0 == c.resize_maxHeight && (c.resize_maxHeight = 3e3);
            void 0 == c.resize_minWidth && (c.resize_minWidth = 750);
            void 0 == c.resize_minHeight && (c.resize_minHeight = 250);
            if (false !== c.resize_enabled) {
                var f = null, g, h, i = ("both" == c.resize_dir || "horizontal" == c.resize_dir) && c.resize_minWidth != c.resize_maxWidth, j = ("both" == c.resize_dir || "vertical" == c.resize_dir) && c.resize_minHeight != c.resize_maxHeight;
                function k(a) {
                    var e = a.data.$.screenX - g.x, f = a.data.$.screenY - g.y, k = h.width, l = h.height, m = k + e * ("rtl" == d ? -1 : 1), n = l + f;
                    if (i) k = Math.max(c.resize_minWidth, Math.min(m, c.resize_maxWidth));
                    if (j) l = Math.max(c.resize_minHeight, Math.min(n, c.resize_maxHeight));
                    b.resize(i ? k : null, l);
                }
                function l(c) {
                    a.document.removeListener("mousemove", k);
                    a.document.removeListener("mouseup", l);
                    if (b.document) {
                        b.document.removeListener("mousemove", k);
                        b.document.removeListener("mouseup", l);
                    }
                }
                var m = e.addFunction(function (d) {
                    if (!f) f = b.getResizable();
                    h = {
                        width: f.$.offsetWidth || 0,
                        height: f.$.offsetHeight || 0
                    };
                    g = {
                        x: d.screenX,
                        y: d.screenY
                    };
                    c.resize_minWidth > h.width && (c.resize_minWidth = h.width);
                    c.resize_minHeight > h.height && (c.resize_minHeight = h.height);
                    a.document.on("mousemove", k);
                    a.document.on("mouseup", l);
                    if (b.document) {
                        b.document.on("mousemove", k);
                        b.document.on("mouseup", l);
                    }
                });
                b.on("destroy", function () {
                    e.removeFunction(m);
                });
                b.on("themeSpace", function (a) {
                    if ("bottom" == a.data.space) {
                        var c = "";
                        if (i && !j) c = " cke_resizer_horizontal";
                        if (!i && j) c = " cke_resizer_vertical";
                        var f = '<div class="cke_resizer' + c + " cke_resizer_" + d + '"' + ' title="' + e.htmlEncode(b.lang.resize) + '"' + ' onmousedown="CKEDITOR.tools.callFunction(' + m + ', event)"' + "></div>";
                        "ltr" == d && "ltr" == c ? a.data.html += f : a.data.html = f + a.data.html;
                    }
                }, b, null, 100);
            }
        }
    });
    !function () {
        var a = {
            modes: {
                wysiwyg: 1,
                source: 1
            },
            readOnly: 1,
            exec: function (a) {
                var b = a.element.$.form;
                if (b) try {
                    b.submit();
                } catch (c) {
                    if (b.submit.click) b.submit.click();
                }
            }
        }, b = "save";
        j.add(b, {
            init: function (c) {
                var d = c.addCommand(b, a);
                d.modes = {
                    wysiwyg: !!c.element.$.form
                };
                c.ui.addButton("Save", {
                    label: c.lang.save,
                    command: b
                });
            }
        });
    }();
    !function () {
        var d = "scaytcheck", f = "";
        function g(a, b) {
            var c = 0, d;
            for (d in b) if (b[d] == a) {
                c = 1;
                break;
            }
            return c;
        }
        var i = function () {
            var d = this, g = function () {
                var e = d.config, f = {};
                f.srcNodeRef = d.document.getWindow().$.frameElement;
                f.assocApp = "CKEDITOR." + a.version + "@" + a.revision;
                f.customerid = e.scayt_customerid || "1:WvF0D4-UtPqN1-43nkD4-NKvUm2-daQqk3-LmNiI-z7Ysb4-mwry24-T8YrS3-Q2tpq2";
                f.customDictionaryIds = e.scayt_customDictionaryIds || "";
                f.userDictionaryName = e.scayt_userDictionaryName || "";
                f.sLang = e.scayt_sLang || "en_US";
                f.onLoad = function () {
                    if (!(c && b.version < 8)) this.addStyle(this.selectorCss(), "padding-bottom: 2px !important;");
                    if (d.focusManager.hasFocus && !k.isControlRestored(d)) this.focus();
                };
                f.onBeforeChange = function () {
                    if (k.getScayt(d) && !d.checkDirty()) setTimeout(function () {
                        d.resetDirty();
                    }, 0);
                };
                var g = window.scayt_custom_params;
                if ("object" == typeof g) for (var i in g) f[i] = g[i];
                if (k.getControlId(d)) f.id = k.getControlId(d);
                var j = new window.scayt(f);
                j.afterMarkupRemove.push(function (a) {
                    new h(a, j.document).mergeSiblings();
                });
                var l = k.instances[d.name];
                if (l) {
                    j.sLang = l.sLang;
                    j.option(l.option());
                    j.paused = l.paused;
                }
                k.instances[d.name] = j;
                try {
                    j.setDisabled(false === k.isPaused(d));
                } catch (m) { }
                d.fire("showScaytState");
            };
            d.on("contentDom", g);
            d.on("contentDomUnload", function () {
                var b = a.document.getElementsByTag("script"), c = /^dojoIoScript(\d+)$/i, d = /^https?:\/\/svc\.webspellchecker\.net\/spellcheck\/script\/ssrv\.cgi/i;
                for (var e = 0; e < b.count(); e++) {
                    var f = b.getItem(e), g = f.getId(), h = f.getAttribute("src");
                    if (g && h && g.match(c) && h.match(d)) f.remove();
                }
            });
            d.on("beforeCommandExec", function (a) {
                if (("source" == a.data.name || "newpage" == a.data.name) && "wysiwyg" == d.mode) {
                    var b = k.getScayt(d);
                    if (b) {
                        k.setPaused(d, !b.disabled);
                        k.setControlId(d, b.id);
                        b.destroy(true);
                        delete k.instances[d.name];
                    }
                } else if ("source" == a.data.name && "source" == d.mode) k.markControlRestore(d);
            });
            d.on("afterCommandExec", function (a) {
                if (!k.isScaytEnabled(d)) return;
                if ("wysiwyg" == d.mode && ("undo" == a.data.name || "redo" == a.data.name)) window.setTimeout(function () {
                    k.getScayt(d).refresh();
                }, 10);
            });
            d.on("destroy", function (a) {
                var b = a.editor, c = k.getScayt(b);
                if (!c) return;
                delete k.instances[b.name];
                k.setControlId(b, c.id);
                c.destroy(true);
            });
            d.on("afterSetData", function () {
                if (k.isScaytEnabled(d)) window.setTimeout(function () {
                    var a = k.getScayt(d);
                    a && a.refresh();
                }, 10);
            });
            d.on("insertElement", function () {
                var a = k.getScayt(d);
                if (k.isScaytEnabled(d)) {
                    if (c) d.getSelection().unlock(true);
                    window.setTimeout(function () {
                        a.focus();
                        a.refresh();
                    }, 10);
                }
            }, this, null, 50);
            d.on("insertHtml", function () {
                var a = k.getScayt(d);
                if (k.isScaytEnabled(d)) {
                    if (c) d.getSelection().unlock(true);
                    window.setTimeout(function () {
                        a.focus();
                        a.refresh();
                    }, 10);
                }
            }, this, null, 50);
            d.on("scaytDialog", function (a) {
                a.data.djConfig = window.djConfig;
                a.data.scayt_control = k.getScayt(d);
                a.data.tab = f;
                a.data.scayt = window.scayt;
            });
            var i = d.dataProcessor, l = i && i.htmlFilter;
            if (l) l.addRules({
                elements: {
                    span: function (a) {
                        if (a.attributes["data-scayt_word"] && a.attributes["data-scaytid"]) {
                            delete a.name;
                            return a;
                        }
                    }
                }
            });
            var m = j.undo.Image.prototype;
            m.equals = e.override(m.equals, function (a) {
                return function (b) {
                    var c = this;
                    var d = c.contents, e = b.contents, f = k.getScayt(c.editor);
                    if (f && k.isScaytReady(c.editor)) {
                        c.contents = f.reset(d) || "";
                        b.contents = f.reset(e) || "";
                    }
                    var g = a.apply(c, arguments);
                    c.contents = d;
                    b.contents = e;
                    return g;
                };
            });
            if (d.document) g();
        };
        j.scayt = {
            engineLoaded: false,
            instances: {},
            controlInfo: {},
            setControlInfo: function (a, b) {
                if (a && a.name && "object" != typeof this.controlInfo[a.name]) this.controlInfo[a.name] = {};
                for (var c in b) this.controlInfo[a.name][c] = b[c];
            },
            isControlRestored: function (a) {
                if (a && a.name && this.controlInfo[a.name]) return this.controlInfo[a.name].restored;
                return false;
            },
            markControlRestore: function (a) {
                this.setControlInfo(a, {
                    restored: true
                });
            },
            setControlId: function (a, b) {
                this.setControlInfo(a, {
                    id: b
                });
            },
            getControlId: function (a) {
                if (a && a.name && this.controlInfo[a.name] && this.controlInfo[a.name].id) return this.controlInfo[a.name].id;
                return null;
            },
            setPaused: function (a, b) {
                this.setControlInfo(a, {
                    paused: b
                });
            },
            isPaused: function (a) {
                if (a && a.name && this.controlInfo[a.name]) return this.controlInfo[a.name].paused;
                return void 0;
            },
            getScayt: function (a) {
                return this.instances[a.name];
            },
            isScaytReady: function (a) {
                return true === this.engineLoaded && "undefined" !== typeof window.scayt && this.getScayt(a);
            },
            isScaytEnabled: function (a) {
                var b = this.getScayt(a);
                return b ? false === b.disabled : false;
            },
            getUiTabs: function (a) {
                var b = [], c = a.config.scayt_uiTabs || "1,1,1";
                c = c.split(",");
                c[3] = "1";
                for (var d = 0; d < 4; d++) b[d] = "undefined" != typeof window.scayt && "undefined" != typeof window.scayt.uiTags ? parseInt(c[d], 10) && window.scayt.uiTags[d] : parseInt(c[d], 10);
                return b;
            },
            loadEngine: function (c) {
                if (b.gecko && b.version < 10900 || b.opera || b.air) return c.fire("showScaytState");
                if (true === this.engineLoaded) return i.apply(c); else if (this.engineLoaded == -1) return a.on("scaytReady", function () {
                    i.apply(c);
                });
                a.on("scaytReady", i, c);
                a.on("scaytReady", function () {
                    this.engineLoaded = true;
                }, this, null, 0);
                this.engineLoaded = -1;
                var d = document.location.protocol;
                d = d.search(/https?:/) != -1 ? d : "http:";
                var e = "svc.webspellchecker.net/scayt26/loader__base.js", f = c.config.scayt_srcUrl || d + "//" + e, g = k.parseUrl(f).path + "/";
                if (void 0 == window.scayt) {
                    a._djScaytConfig = {
                        baseUrl: g,
                        addOnLoad: [function () {
                            a.fireOnce("scaytReady");
                        }],
                        isDebug: false
                    };
                    a.document.getHead().append(a.document.createElement("script", {
                        attributes: {
                            type: "text/javascript",
                            async: "true",
                            src: f
                        }
                    }));
                } else a.fireOnce("scaytReady");
                return null;
            },
            parseUrl: function (a) {
                var b;
                if (a.match && (b = a.match(/(.*)[\/\\](.*?\.\w+)$/))) return {
                    path: b[1],
                    file: b[2]
                }; else return a;
            }
        };
        var k = j.scayt, l = function (a, b, c, d, e, f, g) {
            a.addCommand(d, e);
            a.addMenuItem(d, {
                label: c,
                command: d,
                group: f,
                order: g
            });
        }, m = {
            preserveState: true,
            editorFocus: false,
            canUndo: false,
            exec: function (a) {
                if (k.isScaytReady(a)) {
                    var b = k.isScaytEnabled(a);
                    this.setState(b ? 2 : 1);
                    var c = k.getScayt(a);
                    c.focus();
                    c.setDisabled(b);
                } else if (!a.config.scayt_autoStartup && k.engineLoaded >= 0) {
                    this.setState(0);
                    k.loadEngine(a);
                }
            }
        };
        j.add("scayt", {
            requires: ["menubutton"],
            beforeInit: function (a) {
                var b = a.config.scayt_contextMenuItemsOrder || "suggest|moresuggest|control", c = "";
                b = b.split("|");
                if (b && b.length) for (var d = 0; d < b.length; d++) c += "scayt_" + b[d] + (b.length != parseInt(d, 10) + 1 ? "," : "");
                a.config.menu_groups = c + "," + a.config.menu_groups;
            },
            init: function (c) {
                var e = c.dataProcessor && c.dataProcessor.dataFilter, h = {
                    elements: {
                        span: function (a) {
                            var b = a.attributes;
                            if (b && b["data-scaytid"]) delete a.name;
                        }
                    }
                };
                e && e.addRules(h);
                var i = {}, j = {}, n = c.addCommand(d, m);
                a.dialog.add(d, a.getUrl(this.path + "dialogs/options.js"));
                var o = k.getUiTabs(c), p = "scaytButton";
                c.addMenuGroup(p);
                var q = {}, r = c.lang.scayt;
                q.scaytToggle = {
                    label: r.enable,
                    command: d,
                    group: p
                };
                if (1 == o[0]) q.scaytOptions = {
                    label: r.options,
                    group: p,
                    onClick: function () {
                        f = "options";
                        c.openDialog(d);
                    }
                };
                if (1 == o[1]) q.scaytLangs = {
                    label: r.langs,
                    group: p,
                    onClick: function () {
                        f = "langs";
                        c.openDialog(d);
                    }
                };
                if (1 == o[2]) q.scaytDict = {
                    label: r.dictionariesTab,
                    group: p,
                    onClick: function () {
                        f = "dictionaries";
                        c.openDialog(d);
                    }
                };
                q.scaytAbout = {
                    label: c.lang.scayt.about,
                    group: p,
                    onClick: function () {
                        f = "about";
                        c.openDialog(d);
                    }
                };
                c.addMenuItems(q);
                c.ui.add("Scayt", "menubutton", {
                    label: r.title,
                    title: b.opera ? r.opera_title : r.title,
                    className: "cke_button_scayt",
                    modes: {
                        wysiwyg: 1
                    },
                    onRender: function () {
                        n.on("state", function () {
                            this.setState(n.state);
                        }, this);
                    },
                    onMenu: function () {
                        var a = k.isScaytEnabled(c);
                        c.getMenuItem("scaytToggle").label = r[a ? "disable" : "enable"];
                        var b = k.getUiTabs(c);
                        return {
                            scaytToggle: 2,
                            scaytOptions: a && b[0] ? 2 : 0,
                            scaytLangs: a && b[1] ? 2 : 0,
                            scaytDict: a && b[2] ? 2 : 0,
                            scaytAbout: a && b[3] ? 2 : 0
                        };
                    }
                });
                if (c.contextMenu && c.addMenuItems) c.contextMenu.addListener(function (a, b) {
                    if (!k.isScaytEnabled(c) || b.getRanges()[0].checkReadOnly()) return null;
                    var d = k.getScayt(c), e = d.getScaytNode();
                    if (!e) return null;
                    var f = d.getWord(e);
                    if (!f) return null;
                    var h = d.getLang(), m = {}, n = window.scayt.getSuggestion(f, h);
                    if (!n || !n.length) return null;
                    for (var o in i) {
                        delete c._.menuItems[o];
                        delete c._.commands[o];
                    }
                    for (o in j) {
                        delete c._.menuItems[o];
                        delete c._.commands[o];
                    }
                    i = {};
                    j = {};
                    var p = c.config.scayt_moreSuggestions || "on", q = false, s = c.config.scayt_maxSuggestions;
                    "number" != typeof s && (s = 5);
                    !s && (s = n.length);
                    var t = c.config.scayt_contextCommands || "all";
                    t = t.split("|");
                    for (var u = 0, v = n.length; u < v; u += 1) {
                        var w = "scayt_suggestion_" + n[u].replace(" ", "_"), x = function (a, b) {
                            return {
                                exec: function () {
                                    d.replace(a, b);
                                }
                            };
                        }(e, n[u]);
                        if (u < s) {
                            l(c, "button_" + w, n[u], w, x, "scayt_suggest", u + 1);
                            m[w] = 2;
                            j[w] = 2;
                        } else if ("on" == p) {
                            l(c, "button_" + w, n[u], w, x, "scayt_moresuggest", u + 1);
                            i[w] = 2;
                            q = true;
                        }
                    }
                    if (q) {
                        c.addMenuItem("scayt_moresuggest", {
                            label: r.moreSuggestions,
                            group: "scayt_moresuggest",
                            order: 10,
                            getItems: function () {
                                return i;
                            }
                        });
                        j.scayt_moresuggest = 2;
                    }
                    if (g("all", t) || g("ignore", t)) {
                        var y = {
                            exec: function () {
                                d.ignore(e);
                            }
                        };
                        l(c, "ignore", r.ignore, "scayt_ignore", y, "scayt_control", 1);
                        j.scayt_ignore = 2;
                    }
                    if (g("all", t) || g("ignoreall", t)) {
                        var z = {
                            exec: function () {
                                d.ignoreAll(e);
                            }
                        };
                        l(c, "ignore_all", r.ignoreAll, "scayt_ignore_all", z, "scayt_control", 2);
                        j.scayt_ignore_all = 2;
                    }
                    if (g("all", t) || g("add", t)) {
                        var A = {
                            exec: function () {
                                window.scayt.addWordToUserDictionary(e);
                            }
                        };
                        l(c, "add_word", r.addWord, "scayt_add_word", A, "scayt_control", 3);
                        j.scayt_add_word = 2;
                    }
                    if (d.fireOnContextMenu) d.fireOnContextMenu(c);
                    return j;
                });
                var s = function () {
                    c.removeListener("showScaytState", s);
                    if (!b.opera && !b.air) n.setState(k.isScaytEnabled(c) ? 1 : 2); else n.setState(0);
                };
                c.on("showScaytState", s);
                if (b.opera || b.air) c.on("instanceReady", function () {
                    s();
                });
                if (c.config.scayt_autoStartup) c.on("instanceReady", function () {
                    k.loadEngine(c);
                });
            },
            afterInit: function (a) {
                var b, c = function (a) {
                    if (a.hasAttribute("data-scaytid")) return false;
                };
                if (a._.elementsPath && (b = a._.elementsPath.filters)) b.push(c);
                a.addRemoveFormatFilter && a.addRemoveFormatFilter(c);
            }
        });
    }();
    j.add("smiley", {
        requires: ["dialog"],
        init: function (b) {
            b.config.smiley_path = b.config.smiley_path || this.path + "images/";
            b.addCommand("smiley", new a.dialogCommand("smiley"));
            b.ui.addButton("Smiley", {
                label: b.lang.smiley.toolbar,
                command: "smiley"
            });
            a.dialog.add("smiley", this.path + "dialogs/smiley.js");
        }
    });
    i.smiley_images = ["regular_smile.gif", "sad_smile.gif", "wink_smile.gif", "teeth_smile.gif", "confused_smile.gif", "tounge_smile.gif", "embaressed_smile.gif", "omg_smile.gif", "whatchutalkingabout_smile.gif", "angry_smile.gif", "angel_smile.gif", "shades_smile.gif", "devil_smile.gif", "cry_smile.gif", "lightbulb.gif", "thumbs_down.gif", "thumbs_up.gif", "heart.gif", "broken_heart.gif", "kiss.gif", "envelope.gif"];
    i.smiley_descriptions = ["smiley", "sad", "wink", "laugh", "frown", "cheeky", "blush", "surprise", "indecision", "angry", "angel", "cool", "devil", "crying", "enlightened", "no", "yes", "heart", "broken heart", "kiss", "mail"];
    !function () {
        var b = ".%2 p,.%2 div,.%2 pre,.%2 address,.%2 blockquote,.%2 h1,.%2 h2,.%2 h3,.%2 h4,.%2 h5,.%2 h6{background-repeat: no-repeat;background-position: top %3;border: 1px dotted gray;padding-top: 8px;padding-%3: 8px;}.%2 p{%1p.png);}.%2 div{%1div.png);}.%2 pre{%1pre.png);}.%2 address{%1address.png);}.%2 blockquote{%1blockquote.png);}.%2 h1{%1h1.png);}.%2 h2{%1h2.png);}.%2 h3{%1h3.png);}.%2 h4{%1h4.png);}.%2 h5{%1h5.png);}.%2 h6{%1h6.png);}", c = /%1/g, d = /%2/g, e = /%3/g, f = {
            readOnly: 1,
            preserveState: true,
            editorFocus: false,
            exec: function (a) {
                this.toggleState();
                this.refresh(a);
            },
            refresh: function (a) {
                if (a.document) {
                    var b = 1 == this.state ? "addClass" : "removeClass";
                    a.document.getBody()[b]("cke_show_blocks");
                }
            }
        };
        j.add("showblocks", {
            requires: ["wysiwygarea"],
            init: function (g) {
                var h = g.addCommand("showblocks", f);
                h.canUndo = false;
                if (g.config.startupOutlineBlocks) h.setState(1);
                g.addCss(b.replace(c, "background-image: url(" + a.getUrl(this.path) + "images/block_").replace(d, "cke_show_blocks ").replace(e, "rtl" == g.lang.dir ? "right" : "left"));
                g.ui.addButton("ShowBlocks", {
                    label: g.lang.showBlocks,
                    command: "showblocks"
                });
                g.on("mode", function () {
                    if (0 != h.state) h.refresh(g);
                });
                g.on("contentDom", function () {
                    if (0 != h.state) h.refresh(g);
                });
            }
        });
    }();
    !function () {
        var c = "cke_show_border", d, f = (b.ie6Compat ? [".%1 table.%2,", ".%1 table.%2 td, .%1 table.%2 th", "{", "border : #d3d3d3 1px dotted", "}"] : [".%1 table.%2,", ".%1 table.%2 > tr > td, .%1 table.%2 > tr > th,", ".%1 table.%2 > tbody > tr > td, .%1 table.%2 > tbody > tr > th,", ".%1 table.%2 > thead > tr > td, .%1 table.%2 > thead > tr > th,", ".%1 table.%2 > tfoot > tr > td, .%1 table.%2 > tfoot > tr > th", "{", "border : #d3d3d3 1px dotted", "}"]).join("");
        d = f.replace(/%2/g, c).replace(/%1/g, "cke_show_borders ");
        var g = {
            preserveState: true,
            editorFocus: false,
            readOnly: 1,
            exec: function (a) {
                this.toggleState();
                this.refresh(a);
            },
            refresh: function (a) {
                if (a.document) {
                    var b = 1 == this.state ? "addClass" : "removeClass";
                    a.document.getBody()[b]("cke_show_borders");
                }
            }
        };
        j.add("showborders", {
            requires: ["wysiwygarea"],
            modes: {
                wysiwyg: 1
            },
            init: function (a) {
                var b = a.addCommand("showborders", g);
                b.canUndo = false;
                if (false !== a.config.startupShowBorders) b.setState(1);
                a.addCss(d);
                a.on("mode", function () {
                    if (0 != b.state) b.refresh(a);
                }, null, null, 100);
                a.on("contentDom", function () {
                    if (0 != b.state) b.refresh(a);
                });
                a.on("removeFormatCleanup", function (b) {
                    var d = b.data;
                    if (1 == a.getCommand("showborders").state && d.is("table") && (!d.hasAttribute("border") || parseInt(d.getAttribute("border"), 10) <= 0)) d.addClass(c);
                });
            },
            afterInit: function (a) {
                var b = a.dataProcessor, d = b && b.dataFilter, e = b && b.htmlFilter;
                if (d) d.addRules({
                    elements: {
                        table: function (a) {
                            var b = a.attributes, d = b["class"], e = parseInt(b.border, 10);
                            if ((!e || e <= 0) && (!d || d.indexOf(c) == -1)) b["class"] = (d || "") + " " + c;
                        }
                    }
                });
                if (e) e.addRules({
                    elements: {
                        table: function (a) {
                            var b = a.attributes, d = b["class"];
                            d && (b["class"] = d.replace(c, "").replace(/\s{2}/, " ").replace(/^\s+|\s+$/, ""));
                        }
                    }
                });
            }
        });
        a.on("dialogDefinition", function (a) {
            var b = a.data.name;
            if ("table" == b || "tableProperties" == b) {
                var d = a.data.definition, f = d.getContents("info"), g = f.get("txtBorder"), h = g.commit;
                g.commit = e.override(h, function (a) {
                    return function (b, d) {
                        a.apply(this, arguments);
                        var e = parseInt(this.getValue(), 10);
                        d[!e || e <= 0 ? "addClass" : "removeClass"](c);
                    };
                });
                var i = d.getContents("advanced"), j = i && i.get("advCSSClasses");
                if (j) {
                    j.setup = e.override(j.setup, function (a) {
                        return function () {
                            a.apply(this, arguments);
                            this.setValue(this.getValue().replace(/cke_show_border/, ""));
                        };
                    });
                    j.commit = e.override(j.commit, function (a) {
                        return function (b, c) {
                            a.apply(this, arguments);
                            if (!parseInt(c.getAttribute("border"), 10)) c.addClass("cke_show_border");
                        };
                    });
                }
            }
        });
    }();
    j.add("sourcearea", {
        requires: ["editingblock"],
        init: function (d) {
            var e = j.sourcearea, f = a.document.getWindow();
            d.on("editingBlockReady", function () {
                var a, e;
                d.addMode("source", {
                    load: function (g, i) {
                        if (c && b.version < 8) g.setStyle("position", "relative");
                        d.textarea = a = new h("textarea");
                        a.setAttributes({
                            dir: "ltr",
                            tabIndex: b.webkit ? -1 : d.tabIndex,
                            role: "textbox",
                            "aria-label": d.lang.editorTitle.replace("%1", d.name)
                        });
                        a.addClass("cke_source");
                        a.addClass("cke_enable_context_menu");
                        d.readOnly && a.setAttribute("readOnly", "readonly");
                        var j = {
                            width: b.ie7Compat ? "99%" : "100%",
                            height: "100%",
                            resize: "none",
                            outline: "none",
                            "text-align": "left"
                        };
                        if (c) {
                            e = function () {
                                a.hide();
                                a.setStyle("height", g.$.clientHeight + "px");
                                a.setStyle("width", g.$.clientWidth + "px");
                                a.show();
                            };
                            d.on("resize", e);
                            f.on("resize", e);
                            setTimeout(e, 0);
                        }
                        g.setHtml("");
                        g.append(a);
                        a.setStyles(j);
                        d.fire("ariaWidget", a);
                        a.on("blur", function () {
                            d.focusManager.blur();
                        });
                        a.on("focus", function () {
                            d.focusManager.focus();
                        });
                        d.mayBeDirty = true;
                        this.loadData(i);
                        var k = d.keystrokeHandler;
                        if (k) k.attach(a);
                        setTimeout(function () {
                            d.mode = "source";
                            d.fire("mode", {
                                previousMode: d._.previousMode
                            });
                        }, b.gecko || b.webkit ? 100 : 0);
                    },
                    loadData: function (b) {
                        a.setValue(b);
                        d.fire("dataReady");
                    },
                    getData: function () {
                        return a.getValue();
                    },
                    getSnapshotData: function () {
                        return a.getValue();
                    },
                    unload: function (g) {
                        a.clearCustomData();
                        d.textarea = a = null;
                        if (e) {
                            d.removeListener("resize", e);
                            f.removeListener("resize", e);
                        }
                        if (c && b.version < 8) g.removeStyle("position");
                    },
                    focus: function () {
                        a.focus();
                    }
                });
            });
            d.on("readOnly", function () {
                if ("source" == d.mode) if (d.readOnly) d.textarea.setAttribute("readOnly", "readonly"); else d.textarea.removeAttribute("readOnly");
            });
            d.addCommand("source", e.commands.source);
            if (d.ui.addButton) d.ui.addButton("Source", {
                label: d.lang.source,
                command: "source"
            });
            d.on("mode", function () {
                d.getCommand("source").setState("source" == d.mode ? 1 : 2);
            });
        }
    });
    j.sourcearea = {
        commands: {
            source: {
                modes: {
                    wysiwyg: 1,
                    source: 1
                },
                editorFocus: false,
                readOnly: 1,
                exec: function (a) {
                    if ("wysiwyg" == a.mode) a.fire("saveSnapshot");
                    a.getCommand("source").setState(0);
                    a.setMode("source" == a.mode ? "wysiwyg" : "source");
                },
                canUndo: false
            }
        }
    };
    !function () {
        j.add("stylescombo", {
            requires: ["richcombo", "styles"],
            init: function (f) {
                var g = f.config, h = f.lang.stylesCombo, i = {}, j = [], k;
                function l(b) {
                    f.getStylesSet(function (c) {
                        if (!j.length) {
                            var d, f;
                            for (var h = 0, k = c.length; h < k; h++) {
                                var l = c[h];
                                f = l.name;
                                d = i[f] = new a.style(l);
                                d._name = f;
                                d._.enterMode = g.enterMode;
                                j.push(d);
                            }
                            j.sort(e);
                        }
                        b && b();
                    });
                }
                f.ui.addRichCombo("Styles", {
                    label: h.label,
                    title: h.panelTitle,
                    className: "cke_styles",
                    panel: {
                        css: f.skin.editor.css.concat(g.contentsCss),
                        multiSelect: true,
                        attributes: {
                            "aria-label": h.panelTitle
                        }
                    },
                    init: function () {
                        k = this;
                        l(function () {
                            var a, b, c, d, e, f;
                            for (e = 0, f = j.length; e < f; e++) {
                                a = j[e];
                                b = a._name;
                                d = a.type;
                                if (d != c) {
                                    k.startGroup(h["panelTitle" + String(d)]);
                                    c = d;
                                }
                                k.add(b, 3 == a.type ? b : a.buildPreview(), b);
                            }
                            k.commit();
                        });
                    },
                    onClick: function (a) {
                        f.focus();
                        f.fire("saveSnapshot");
                        var b = i[a], c = f.getSelection(), e = new d.elementPath(c.getStartElement());
                        b[b.checkActive(e) ? "remove" : "apply"](f.document);
                        f.fire("saveSnapshot");
                    },
                    onRender: function () {
                        f.on("selectionChange", function (a) {
                            var b = this.getValue(), c = a.data.path, d = c.elements;
                            for (var e = 0, f = d.length, g; e < f; e++) {
                                g = d[e];
                                for (var h in i) if (i[h].checkElementRemovable(g, true)) {
                                    if (h != b) this.setValue(h);
                                    return;
                                }
                            }
                            this.setValue("");
                        }, this);
                    },
                    onOpen: function () {
                        var a = this;
                        if (c || b.webkit) f.focus();
                        var e = f.getSelection(), g = e.getSelectedElement(), j = new d.elementPath(g || e.getStartElement()), k = [0, 0, 0, 0];
                        a.showAll();
                        a.unmarkAll();
                        for (var l in i) {
                            var m = i[l], n = m.type;
                            if (m.checkActive(j)) a.mark(l); else if (3 == n && !m.checkApplicable(j)) {
                                a.hideItem(l);
                                k[n]--;
                            }
                            k[n]++;
                        }
                        if (!k[1]) a.hideGroup(h["panelTitle" + String(1)]);
                        if (!k[2]) a.hideGroup(h["panelTitle" + String(2)]);
                        if (!k[3]) a.hideGroup(h["panelTitle" + String(3)]);
                    },
                    reset: function () {
                        if (k) {
                            delete k._.panel;
                            delete k._.list;
                            k._.committed = 0;
                            k._.items = {};
                            k._.state = 2;
                        }
                        i = {};
                        j = [];
                        l();
                    }
                });
                f.on("instanceReady", function () {
                    l();
                });
            }
        });
        function e(a, b) {
            var c = a.type, d = b.type;
            return c == d ? 0 : 3 == c ? -1 : 3 == d ? 1 : 1 == d ? 1 : -1;
        }
    }();
    j.add("table", {
        requires: ["dialog"],
        init: function (b) {
            var c = j.table, d = b.lang.table;
            b.addCommand("table", new a.dialogCommand("table"));
            b.addCommand("tableProperties", new a.dialogCommand("tableProperties"));
            b.ui.addButton("Table", {
                label: d.toolbar,
                command: "table"
            });
            a.dialog.add("table", this.path + "dialogs/table.js");
            a.dialog.add("tableProperties", this.path + "dialogs/table.js");
            if (b.addMenuItems) b.addMenuItems({
                table: {
                    label: d.menu,
                    command: "tableProperties",
                    group: "table",
                    order: 5
                },
                tabledelete: {
                    label: d.deleteTable,
                    command: "tableDelete",
                    group: "table",
                    order: 1
                }
            });
            b.on("doubleclick", function (a) {
                var b = a.data.element;
                if (b.is("table")) a.data.dialog = "tableProperties";
            });
            if (b.contextMenu) b.contextMenu.addListener(function (a, b) {
                if (!a || a.isReadOnly()) return null;
                var c = a.hasAscendant("table", 1);
                if (c) return {
                    tabledelete: 2,
                    table: 2
                };
                return null;
            });
        }
    });
    !function () {
        var b = /^(?:td|th)$/;
        function f(a) {
            var c = a.getRanges(), e = [], f = {};
            function g(a) {
                if (e.length > 0) return;
                if (1 == a.type && b.test(a.getName()) && !a.getCustomData("selected_cell")) {
                    h.setMarker(f, a, "selected_cell", true);
                    e.push(a);
                }
            }
            for (var i = 0; i < c.length; i++) {
                var j = c[i];
                if (j.collapsed) {
                    var k = j.getCommonAncestor(), l = k.getAscendant("td", true) || k.getAscendant("th", true);
                    if (l) e.push(l);
                } else {
                    var m = new d.walker(j), n;
                    m.guard = g;
                    while (n = m.next()) {
                        var o = n.getAscendant("td") || n.getAscendant("th");
                        if (o && !o.getCustomData("selected_cell")) {
                            h.setMarker(f, o, "selected_cell", true);
                            e.push(o);
                        }
                    }
                }
            }
            h.clearAllMarkers(f);
            return e;
        }
        function g(a) {
            var b = 0, c = a.length - 1, d = {}, e, f, g;
            while (e = a[b++]) h.setMarker(d, e, "delete_cell", true);
            b = 0;
            while (e = a[b++]) if ((f = e.getPrevious()) && !f.getCustomData("delete_cell") || (f = e.getNext()) && !f.getCustomData("delete_cell")) {
                h.clearAllMarkers(d);
                return f;
            }
            h.clearAllMarkers(d);
            g = a[0].getParent();
            if (g = g.getPrevious()) return g.getLast();
            g = a[c].getParent();
            if (g = g.getNext()) return g.getChild(0);
            return null;
        }
        function i(a, b) {
            var d = f(a), g = d[0], i = g.getAscendant("table"), j = g.getDocument(), k = d[0].getParent(), l = k.$.rowIndex, m = d[d.length - 1], n = m.getParent().$.rowIndex + m.$.rowSpan - 1, o = new h(i.$.rows[n]), p = b ? l : n, q = b ? k : o, r = e.buildTableMap(i), s = r[p], t = b ? r[p - 1] : r[p + 1], u = r[0].length, v = j.createElement("tr");
            for (var w = 0; s[w] && w < u; w++) {
                var x;
                if (s[w].rowSpan > 1 && t && s[w] == t[w]) {
                    x = s[w];
                    x.rowSpan += 1;
                } else {
                    x = new h(s[w]).clone();
                    x.removeAttribute("rowSpan");
                    !c && x.appendBogus();
                    v.append(x);
                    x = x.$;
                }
                w += x.colSpan - 1;
            }
            b ? v.insertBefore(q) : v.insertAfter(q);
        }
        function k(a) {
            if (a instanceof d.selection) {
                var b = f(a), c = b[0], g = c.getAscendant("table"), i = e.buildTableMap(g), j = b[0].getParent(), l = j.$.rowIndex, m = b[b.length - 1], n = m.getParent().$.rowIndex + m.$.rowSpan - 1, o = [];
                for (var p = l; p <= n; p++) {
                    var q = i[p], r = new h(g.$.rows[p]);
                    for (var s = 0; s < q.length; s++) {
                        var t = new h(q[s]), u = t.getParent().$.rowIndex;
                        if (1 == t.$.rowSpan) t.remove(); else {
                            t.$.rowSpan -= 1;
                            if (u == p) {
                                var v = i[p + 1];
                                v[s - 1] ? t.insertAfter(new h(v[s - 1])) : new h(g.$.rows[p + 1]).append(t, 1);
                            }
                        }
                        s += t.$.colSpan - 1;
                    }
                    o.push(r);
                }
                var w = g.$.rows, x = new h(w[n + 1] || (l > 0 ? w[l - 1] : null) || g.$.parentNode);
                for (p = o.length; p >= 0; p--) k(o[p]);
                return x;
            } else if (a instanceof h) {
                g = a.getAscendant("table");
                if (1 == g.$.rows.length) g.remove(); else a.remove();
            }
            return null;
        }
        function l(a, b) {
            var c = a.getParent(), d = c.$.cells, e = 0;
            for (var f = 0; f < d.length; f++) {
                var g = d[f];
                e += b ? 1 : g.colSpan;
                if (g == a.$) break;
            }
            return e - 1;
        }
        function m(a, b) {
            var c = b ? 1 / 0 : 0;
            for (var d = 0; d < a.length; d++) {
                var e = l(a[d], b);
                if (b ? e < c : e > c) c = e;
            }
            return c;
        }
        function n(a, b) {
            var d = f(a), g = d[0], i = g.getAscendant("table"), j = m(d, 1), k = m(d), l = b ? j : k, n = e.buildTableMap(i), o = [], p = [], q = n.length;
            for (var r = 0; r < q; r++) {
                o.push(n[r][l]);
                var s = b ? n[r][l - 1] : n[r][l + 1];
                p.push(s);
            }
            for (r = 0; r < q; r++) {
                var t;
                if (!o[r]) continue;
                if (o[r].colSpan > 1 && p[r] == o[r]) {
                    t = o[r];
                    t.colSpan += 1;
                } else {
                    t = new h(o[r]).clone();
                    t.removeAttribute("colSpan");
                    !c && t.appendBogus();
                    t[b ? "insertBefore" : "insertAfter"].call(t, new h(o[r]));
                    t = t.$;
                }
                r += t.rowSpan - 1;
            }
        }
        function o(a) {
            var b = f(a), c = b[0], d = b[b.length - 1], g = c.getAscendant("table"), i = e.buildTableMap(g), j, k, l = [];
            for (var m = 0, n = i.length; m < n; m++) for (var o = 0, p = i[m].length; o < p; o++) {
                if (i[m][o] == c.$) j = o;
                if (i[m][o] == d.$) k = o;
            }
            for (m = j; m <= k; m++) for (o = 0; o < i.length; o++) {
                var q = i[o], r = new h(g.$.rows[o]), s = new h(q[m]);
                if (s.$) {
                    if (1 == s.$.colSpan) s.remove(); else s.$.colSpan -= 1;
                    o += s.$.rowSpan - 1;
                    if (!r.$.cells.length) l.push(r);
                }
            }
            var t = g.$.rows[0] && g.$.rows[0].cells, u = new h(t[j] || (j ? t[j - 1] : g.$.parentNode));
            if (l.length == n) g.remove();
            return u;
        }
        function p(a) {
            var b = [], c = a[0] && a[0].getAscendant("table"), d, e, f, g;
            for (d = 0, e = a.length; d < e; d++) b.push(a[d].$.cellIndex);
            b.sort();
            for (d = 1, e = b.length; d < e; d++) if (b[d] - b[d - 1] > 1) {
                f = b[d - 1] + 1;
                break;
            }
            if (!f) f = b[0] > 0 ? b[0] - 1 : b[b.length - 1] + 1;
            var i = c.$.rows;
            for (d = 0, e = i.length; d < e; d++) {
                g = i[d].cells[f];
                if (g) break;
            }
            return g ? new h(g) : c.getPrevious();
        }
        function q(a, b) {
            var d = a.getStartElement(), e = d.getAscendant("td", 1) || d.getAscendant("th", 1);
            if (!e) return;
            var f = e.clone();
            if (!c) f.appendBogus();
            if (b) f.insertBefore(e); else f.insertAfter(e);
        }
        function r(a) {
            if (a instanceof d.selection) {
                var b = f(a), c = b[0] && b[0].getAscendant("table"), e = g(b);
                for (var i = b.length - 1; i >= 0; i--) r(b[i]);
                if (e) t(e, true); else if (c) c.remove();
            } else if (a instanceof h) {
                var j = a.getParent();
                if (1 == j.getChildCount()) j.remove(); else a.remove();
            }
        }
        function s(a) {
            var b = a.getBogus();
            b && b.remove();
            a.trim();
        }
        function t(a, b) {
            var c = new d.range(a.getDocument());
            if (!c["moveToElementEdit" + (b ? "End" : "Start")](a)) {
                c.selectNodeContents(a);
                c.collapse(b ? false : true);
            }
            c.select(true);
        }
        function u(a, b, c) {
            var d = a[b];
            if ("undefined" == typeof c) return d;
            for (var e = 0; d && e < d.length; e++) if (c.is && d[e] == c.$) return e; else if (e == c) return new h(d[e]);
            return c.is ? -1 : null;
        }
        function v(a, b) {
            var c = [];
            for (var d = 0; d < a.length; d++) {
                var e = a[d];
                c.push(e[b]);
                if (e[b].rowSpan > 1) d += e[b].rowSpan - 1;
            }
            return c;
        }
        function w(a, b, g) {
            var i = f(a), j;
            if ((b ? 1 != i.length : i.length < 2) || (j = a.getCommonAncestor()) && 1 == j.type && j.is("table")) return false;
            var k, l = i[0], m = l.getAscendant("table"), n = e.buildTableMap(m), o = n.length, p = n[0].length, q = l.getParent().$.rowIndex, r = u(n, q, l);
            if (b) {
                var t;
                try {
                    var v = parseInt(l.getAttribute("rowspan"), 10) || 1, w = parseInt(l.getAttribute("colspan"), 10) || 1;
                    t = n["up" == b ? q - v : "down" == b ? q + v : q]["left" == b ? r - w : "right" == b ? r + w : r];
                } catch (x) {
                    return false;
                }
                if (!t || l.$ == t) return false;
                i["up" == b || "left" == b ? "unshift" : "push"](new h(t));
            }
            var y = l.getDocument(), z = q, A = 0, B = 0, C = !g && new d.documentFragment(y), D = 0;
            for (var E = 0; E < i.length; E++) {
                k = i[E];
                var F = k.getParent(), G = k.getFirst(), H = k.$.colSpan, I = k.$.rowSpan, J = F.$.rowIndex, K = u(n, J, k);
                D += H * I;
                B = Math.max(B, K - r + H);
                A = Math.max(A, J - q + I);
                if (!g) {
                    if (s(k), k.getChildren().count()) {
                        if (J != z && G && !(G.isBlockBoundary && G.isBlockBoundary({
                            br: 1
                        }))) {
                            var L = C.getLast(d.walker.whitespaces(true));
                            if (L && !(L.is && L.is("br"))) C.append("br");
                        }
                        k.moveChildren(C);
                    }
                    E ? k.remove() : k.setHtml("");
                }
                z = J;
            }
            if (!g) {
                C.moveChildren(l);
                if (!c) l.appendBogus();
                if (B >= p) l.removeAttribute("rowSpan"); else l.$.rowSpan = A;
                if (A >= o) l.removeAttribute("colSpan"); else l.$.colSpan = B;
                var M = new d.nodeList(m.$.rows), N = M.count();
                for (E = N - 1; E >= 0; E--) {
                    var O = M.getItem(E);
                    if (!O.$.cells.length) {
                        O.remove();
                        N++;
                        continue;
                    }
                }
                return l;
            } else return A * B == D;
        }
        function x(a, b) {
            var d = f(a);
            if (d.length > 1) return false; else if (b) return true;
            var g = d[0], i = g.getParent(), j = i.getAscendant("table"), k = e.buildTableMap(j), l = i.$.rowIndex, m = u(k, l, g), n = g.$.rowSpan, o, p, q, r;
            if (n > 1) {
                p = Math.ceil(n / 2);
                q = Math.floor(n / 2);
                r = l + p;
                var s = new h(j.$.rows[r]), t = u(k, r), v;
                o = g.clone();
                for (var w = 0; w < t.length; w++) {
                    v = t[w];
                    if (v.parentNode == s.$ && w > m) {
                        o.insertBefore(new h(v));
                        break;
                    } else v = null;
                }
                if (!v) s.append(o, true);
            } else {
                q = p = 1;
                s = i.clone();
                s.insertAfter(i);
                s.append(o = g.clone());
                var x = u(k, l);
                for (var y = 0; y < x.length; y++) x[y].rowSpan++;
            }
            if (!c) o.appendBogus();
            g.$.rowSpan = p;
            o.$.rowSpan = q;
            if (1 == p) g.removeAttribute("rowSpan");
            if (1 == q) o.removeAttribute("rowSpan");
            return o;
        }
        function y(a, b) {
            var d = f(a);
            if (d.length > 1) return false; else if (b) return true;
            var g = d[0], h = g.getParent(), i = h.getAscendant("table"), j = e.buildTableMap(i), k = h.$.rowIndex, l = u(j, k, g), m = g.$.colSpan, n, o, p;
            if (m > 1) {
                o = Math.ceil(m / 2);
                p = Math.floor(m / 2);
            } else {
                p = o = 1;
                var q = v(j, l);
                for (var r = 0; r < q.length; r++) q[r].colSpan++;
            }
            n = g.clone();
            n.insertAfter(g);
            if (!c) n.appendBogus();
            g.$.colSpan = o;
            n.$.colSpan = p;
            if (1 == o) g.removeAttribute("colSpan");
            if (1 == p) n.removeAttribute("colSpan");
            return n;
        }
        var z = {
            thead: 1,
            tbody: 1,
            tfoot: 1,
            td: 1,
            tr: 1,
            th: 1
        };
        j.tabletools = {
            requires: ["table", "dialog"],
            init: function (b) {
                var c = b.lang.table;
                b.addCommand("cellProperties", new a.dialogCommand("cellProperties"));
                a.dialog.add("cellProperties", this.path + "dialogs/tableCell.js");
                b.addCommand("tableDelete", {
                    exec: function (a) {
                        var b = a.getSelection(), c = b && b.getStartElement(), e = c && c.getAscendant("table", 1);
                        if (!e) return;
                        var f = e.getParent();
                        if (1 == f.getChildCount() && !f.is("body", "td", "th")) e = f;
                        var g = new d.range(a.document);
                        g.moveToPosition(e, 3);
                        e.remove();
                        g.select();
                    }
                });
                b.addCommand("rowDelete", {
                    exec: function (a) {
                        var b = a.getSelection();
                        t(k(b));
                    }
                });
                b.addCommand("rowInsertBefore", {
                    exec: function (a) {
                        var b = a.getSelection();
                        i(b, true);
                    }
                });
                b.addCommand("rowInsertAfter", {
                    exec: function (a) {
                        var b = a.getSelection();
                        i(b);
                    }
                });
                b.addCommand("columnDelete", {
                    exec: function (a) {
                        var b = a.getSelection(), c = o(b);
                        c && t(c, true);
                    }
                });
                b.addCommand("columnInsertBefore", {
                    exec: function (a) {
                        var b = a.getSelection();
                        n(b, true);
                    }
                });
                b.addCommand("columnInsertAfter", {
                    exec: function (a) {
                        var b = a.getSelection();
                        n(b);
                    }
                });
                b.addCommand("cellDelete", {
                    exec: function (a) {
                        var b = a.getSelection();
                        r(b);
                    }
                });
                b.addCommand("cellMerge", {
                    exec: function (a) {
                        t(w(a.getSelection()), true);
                    }
                });
                b.addCommand("cellMergeRight", {
                    exec: function (a) {
                        t(w(a.getSelection(), "right"), true);
                    }
                });
                b.addCommand("cellMergeDown", {
                    exec: function (a) {
                        t(w(a.getSelection(), "down"), true);
                    }
                });
                b.addCommand("cellVerticalSplit", {
                    exec: function (a) {
                        t(x(a.getSelection()));
                    }
                });
                b.addCommand("cellHorizontalSplit", {
                    exec: function (a) {
                        t(y(a.getSelection()));
                    }
                });
                b.addCommand("cellInsertBefore", {
                    exec: function (a) {
                        var b = a.getSelection();
                        q(b, true);
                    }
                });
                b.addCommand("cellInsertAfter", {
                    exec: function (a) {
                        var b = a.getSelection();
                        q(b);
                    }
                });
                if (b.addMenuItems) b.addMenuItems({
                    tablecell: {
                        label: c.cell.menu,
                        group: "tablecell",
                        order: 1,
                        getItems: function () {
                            var a = b.getSelection(), c = f(a);
                            return {
                                tablecell_insertBefore: 2,
                                tablecell_insertAfter: 2,
                                tablecell_delete: 2,
                                tablecell_merge: w(a, null, true) ? 2 : 0,
                                tablecell_merge_right: w(a, "right", true) ? 2 : 0,
                                tablecell_merge_down: w(a, "down", true) ? 2 : 0,
                                tablecell_split_vertical: x(a, true) ? 2 : 0,
                                tablecell_split_horizontal: y(a, true) ? 2 : 0,
                                tablecell_properties: c.length > 0 ? 2 : 0
                            };
                        }
                    },
                    tablecell_insertBefore: {
                        label: c.cell.insertBefore,
                        group: "tablecell",
                        command: "cellInsertBefore",
                        order: 5
                    },
                    tablecell_insertAfter: {
                        label: c.cell.insertAfter,
                        group: "tablecell",
                        command: "cellInsertAfter",
                        order: 10
                    },
                    tablecell_delete: {
                        label: c.cell.deleteCell,
                        group: "tablecell",
                        command: "cellDelete",
                        order: 15
                    },
                    tablecell_merge: {
                        label: c.cell.merge,
                        group: "tablecell",
                        command: "cellMerge",
                        order: 16
                    },
                    tablecell_merge_right: {
                        label: c.cell.mergeRight,
                        group: "tablecell",
                        command: "cellMergeRight",
                        order: 17
                    },
                    tablecell_merge_down: {
                        label: c.cell.mergeDown,
                        group: "tablecell",
                        command: "cellMergeDown",
                        order: 18
                    },
                    tablecell_split_horizontal: {
                        label: c.cell.splitHorizontal,
                        group: "tablecell",
                        command: "cellHorizontalSplit",
                        order: 19
                    },
                    tablecell_split_vertical: {
                        label: c.cell.splitVertical,
                        group: "tablecell",
                        command: "cellVerticalSplit",
                        order: 20
                    },
                    tablecell_properties: {
                        label: c.cell.title,
                        group: "tablecellproperties",
                        command: "cellProperties",
                        order: 21
                    },
                    tablerow: {
                        label: c.row.menu,
                        group: "tablerow",
                        order: 1,
                        getItems: function () {
                            return {
                                tablerow_insertBefore: 2,
                                tablerow_insertAfter: 2,
                                tablerow_delete: 2
                            };
                        }
                    },
                    tablerow_insertBefore: {
                        label: c.row.insertBefore,
                        group: "tablerow",
                        command: "rowInsertBefore",
                        order: 5
                    },
                    tablerow_insertAfter: {
                        label: c.row.insertAfter,
                        group: "tablerow",
                        command: "rowInsertAfter",
                        order: 10
                    },
                    tablerow_delete: {
                        label: c.row.deleteRow,
                        group: "tablerow",
                        command: "rowDelete",
                        order: 15
                    },
                    tablecolumn: {
                        label: c.column.menu,
                        group: "tablecolumn",
                        order: 1,
                        getItems: function () {
                            return {
                                tablecolumn_insertBefore: 2,
                                tablecolumn_insertAfter: 2,
                                tablecolumn_delete: 2
                            };
                        }
                    },
                    tablecolumn_insertBefore: {
                        label: c.column.insertBefore,
                        group: "tablecolumn",
                        command: "columnInsertBefore",
                        order: 5
                    },
                    tablecolumn_insertAfter: {
                        label: c.column.insertAfter,
                        group: "tablecolumn",
                        command: "columnInsertAfter",
                        order: 10
                    },
                    tablecolumn_delete: {
                        label: c.column.deleteColumn,
                        group: "tablecolumn",
                        command: "columnDelete",
                        order: 15
                    }
                });
                if (b.contextMenu) b.contextMenu.addListener(function (a, b) {
                    if (!a || a.isReadOnly()) return null;
                    while (a) {
                        if (a.getName() in z) return {
                            tablecell: 2,
                            tablerow: 2,
                            tablecolumn: 2
                        };
                        a = a.getParent();
                    }
                    return null;
                });
            },
            getSelectedCells: f
        };
        j.add("tabletools", j.tabletools);
    }();
    e.buildTableMap = function (a) {
        var b = a.$.rows, c = -1, d = [];
        for (var e = 0; e < b.length; e++) {
            c++;
            !d[c] && (d[c] = []);
            var f = -1;
            for (var g = 0; g < b[e].cells.length; g++) {
                var h = b[e].cells[g];
                f++;
                while (d[c][f]) f++;
                var i = isNaN(h.colSpan) ? 1 : h.colSpan, j = isNaN(h.rowSpan) ? 1 : h.rowSpan;
                for (var k = 0; k < j; k++) {
                    if (!d[c + k]) d[c + k] = [];
                    for (var l = 0; l < i; l++) d[c + k][f + l] = b[e].cells[g];
                }
                f += i - 1;
            }
        }
        return d;
    };
    j.add("specialchar", {
        requires: ["dialog"],
        availableLangs: {
            cs: 1,
            cy: 1,
            de: 1,
            el: 1,
            en: 1,
            eo: 1,
            et: 1,
            fa: 1,
            fi: 1,
            fr: 1,
            he: 1,
            hr: 1,
            it: 1,
            nb: 1,
            nl: 1,
            no: 1,
            "pt-br": 1,
            tr: 1,
            ug: 1,
            "zh-cn": 1
        },
        init: function (b) {
            var c = "specialchar", d = this;
            a.dialog.add(c, this.path + "dialogs/specialchar.js");
            b.addCommand(c, {
                exec: function () {
                    var f = b.langCode;
                    f = d.availableLangs[f] ? f : "en";
                    a.scriptLoader.load(a.getUrl(d.path + "lang/" + f + ".js"), function () {
                        e.extend(b.lang.specialChar, d.langEntries[f]);
                        b.openDialog(c);
                    });
                },
                modes: {
                    wysiwyg: 1
                },
                canUndo: false
            });
            b.ui.addButton("SpecialChar", {
                label: b.lang.specialChar.toolbar,
                command: c
            });
        }
    });
    i.specialChars = ["!", "&quot;", "#", "$", "%", "&amp;", "'", "(", ")", "*", "+", "-", ".", "/", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "&lt;", "=", "&gt;", "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "[", "]", "^", "_", "`", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "{", "|", "}", "~", "&euro;", "&lsquo;", "&rsquo;", "&ldquo;", "&rdquo;", "&ndash;", "&mdash;", "&iexcl;", "&cent;", "&pound;", "&curren;", "&yen;", "&brvbar;", "&sect;", "&uml;", "&copy;", "&ordf;", "&laquo;", "&not;", "&reg;", "&macr;", "&deg;", "&sup2;", "&sup3;", "&acute;", "&micro;", "&para;", "&middot;", "&cedil;", "&sup1;", "&ordm;", "&raquo;", "&frac14;", "&frac12;", "&frac34;", "&iquest;", "&Agrave;", "&Aacute;", "&Acirc;", "&Atilde;", "&Auml;", "&Aring;", "&AElig;", "&Ccedil;", "&Egrave;", "&Eacute;", "&Ecirc;", "&Euml;", "&Igrave;", "&Iacute;", "&Icirc;", "&Iuml;", "&ETH;", "&Ntilde;", "&Ograve;", "&Oacute;", "&Ocirc;", "&Otilde;", "&Ouml;", "&times;", "&Oslash;", "&Ugrave;", "&Uacute;", "&Ucirc;", "&Uuml;", "&Yacute;", "&THORN;", "&szlig;", "&agrave;", "&aacute;", "&acirc;", "&atilde;", "&auml;", "&aring;", "&aelig;", "&ccedil;", "&egrave;", "&eacute;", "&ecirc;", "&euml;", "&igrave;", "&iacute;", "&icirc;", "&iuml;", "&eth;", "&ntilde;", "&ograve;", "&oacute;", "&ocirc;", "&otilde;", "&ouml;", "&divide;", "&oslash;", "&ugrave;", "&uacute;", "&ucirc;", "&uuml;", "&yacute;", "&thorn;", "&yuml;", "&OElig;", "&oelig;", "&#372;", "&#374", "&#373", "&#375;", "&sbquo;", "&#8219;", "&bdquo;", "&hellip;", "&trade;", "&#9658;", "&bull;", "&rarr;", "&rArr;", "&hArr;", "&diams;", "&asymp;"];
    !function () {
        var a = {
            editorFocus: false,
            modes: {
                wysiwyg: 1,
                source: 1
            }
        }, f = {
            exec: function (a) {
                a.container.focusNext(true, a.tabIndex);
            }
        }, g = {
            exec: function (a) {
                a.container.focusPrevious(true, a.tabIndex);
            }
        };
        function i(a) {
            return {
                editorFocus: false,
                canUndo: false,
                modes: {
                    wysiwyg: 1
                },
                exec: function (b) {
                    if (b.focusManager.hasFocus) {
                        var f = b.getSelection(), g = f.getCommonAncestor(), i;
                        if (i = g.getAscendant("td", true) || g.getAscendant("th", true)) {
                            var j = new d.range(b.document), k = e.tryThese(function () {
                                var b = i.getParent(), c = b.$.cells[i.$.cellIndex + (a ? -1 : 1)];
                                c.parentNode.parentNode;
                                return c;
                            }, function () {
                                var b = i.getParent(), c = b.getAscendant("table"), d = c.$.rows[b.$.rowIndex + (a ? -1 : 1)];
                                return d.cells[a ? d.cells.length - 1 : 0];
                            });
                            if (!(k || a)) {
                                var l = i.getAscendant("table").$, m = i.getParent().$.cells, n = new h(l.insertRow(-1), b.document);
                                for (var o = 0, p = m.length; o < p; o++) {
                                    var q = n.append(new h(m[o], b.document).clone(false, false));
                                    !c && q.appendBogus();
                                }
                                j.moveToElementEditStart(n);
                            } else if (k) {
                                k = new h(k);
                                j.moveToElementEditStart(k);
                                if (!(j.checkStartOfBlock() && j.checkEndOfBlock())) j.selectNodeContents(k);
                            } else return true;
                            j.select(true);
                            return true;
                        }
                    }
                    return false;
                }
            };
        }
        j.add("tab", {
            requires: ["keystrokes"],
            init: function (c) {
                var d = false !== c.config.enableTabKeyTools, h = c.config.tabSpaces || 0, j = "";
                while (h--) j += " ";
                if (j) c.on("key", function (a) {
                    if (9 == a.data.keyCode) {
                        c.insertHtml(j);
                        a.cancel();
                    }
                });
                if (d) c.on("key", function (a) {
                    if (9 == a.data.keyCode && c.execCommand("selectNextCell") || a.data.keyCode == 2228224 + 9 && c.execCommand("selectPreviousCell")) a.cancel();
                });
                if (b.webkit || b.gecko) c.on("key", function (a) {
                    var b = a.data.keyCode;
                    if (9 == b && !j) {
                        a.cancel();
                        c.execCommand("blur");
                    }
                    if (b == 2228224 + 9) {
                        c.execCommand("blurBack");
                        a.cancel();
                    }
                });
                c.addCommand("blur", e.extend(f, a));
                c.addCommand("blurBack", e.extend(g, a));
                c.addCommand("selectNextCell", i());
                c.addCommand("selectPreviousCell", i(true));
            }
        });
    }();
    h.prototype.focusNext = function (a, b) {
        var c = this;
        var d = c.$, e = void 0 === b ? c.getTabIndex() : b, f, g, h, i, j, k;
        if (e <= 0) {
            j = c.getNextSourceNode(a, 1);
            while (j) {
                if (j.isVisible() && 0 === j.getTabIndex()) {
                    h = j;
                    break;
                }
                j = j.getNextSourceNode(false, 1);
            }
        } else {
            j = c.getDocument().getBody().getFirst();
            while (j = j.getNextSourceNode(false, 1)) {
                if (!f) if (!g && j.equals(c)) {
                    g = true;
                    if (a) {
                        if (!(j = j.getNextSourceNode(true, 1))) break;
                        f = 1;
                    }
                } else if (g && !c.contains(j)) f = 1;
                if (!j.isVisible() || (k = j.getTabIndex()) < 0) continue;
                if (f && k == e) {
                    h = j;
                    break;
                }
                if (k > e && (!h || !i || k < i)) {
                    h = j;
                    i = k;
                } else if (!h && 0 === k) {
                    h = j;
                    i = k;
                }
            }
        }
        if (h) h.focus();
    };
    h.prototype.focusPrevious = function (a, b) {
        var c = this;
        var d = c.$, e = void 0 === b ? c.getTabIndex() : b, f, g, h, i = 0, j, k = c.getDocument().getBody().getLast();
        while (k = k.getPreviousSourceNode(false, 1)) {
            if (!f) if (!g && k.equals(c)) {
                g = true;
                if (a) {
                    if (!(k = k.getPreviousSourceNode(true, 1))) break;
                    f = 1;
                }
            } else if (g && !c.contains(k)) f = 1;
            if (!k.isVisible() || (j = k.getTabIndex()) < 0) continue;
            if (e <= 0) {
                if (f && 0 === j) {
                    h = k;
                    break;
                }
                if (j > i) {
                    h = k;
                    i = j;
                }
            } else {
                if (f && j == e) {
                    h = k;
                    break;
                }
                if (j < e && (!h || j > i)) {
                    h = k;
                    i = j;
                }
            }
        }
        if (h) h.focus();
    };
    !function () {
        j.add("templates", {
            requires: ["dialog"],
            init: function (b) {
                a.dialog.add("templates", a.getUrl(this.path + "dialogs/templates.js"));
                b.addCommand("templates", new a.dialogCommand("templates"));
                b.ui.addButton("Templates", {
                    label: b.lang.templates.button,
                    command: "templates"
                });
            }
        });
        var b = {}, c = {};
        a.addTemplates = function (a, c) {
            b[a] = c;
        };
        a.getTemplates = function (a) {
            return b[a];
        };
        a.loadTemplates = function (b, d) {
            var e = [];
            for (var f = 0, g = b.length; f < g; f++) if (!c[b[f]]) {
                e.push(b[f]);
                c[b[f]] = 1;
            }
            if (e.length) a.scriptLoader.load(e, d); else setTimeout(d, 0);
        };
    }();
    i.templates_files = [a.getUrl("plugins/templates/templates/default.js")];
    i.templates_replaceContent = true;
    !function () {
        var d = function () {
            this.toolbars = [];
            this.focusCommandExecuted = false;
        };
        d.prototype.focus = function () {
            for (var a = 0, b; b = this.toolbars[a++];) for (var c = 0, d; d = b.items[c++];) if (d.focus) {
                d.focus();
                return;
            }
        };
        var f = {
            toolbarFocus: {
                modes: {
                    wysiwyg: 1,
                    source: 1
                },
                readOnly: 1,
                exec: function (a) {
                    if (a.toolbox) {
                        a.toolbox.focusCommandExecuted = true;
                        if (c || b.air) setTimeout(function () {
                            a.toolbox.focus();
                        }, 100); else a.toolbox.focus();
                    }
                }
            }
        };
        j.add("toolbar", {
            requires: ["button"],
            init: function (b) {
                var c, g = function (a, d) {
                    var e, f, h = "rtl" == b.lang.dir, i = b.config.toolbarGroupCycling;
                    i = void 0 === i || i;
                    switch (d) {
                        case 9:
                        case 2228224 + 9:
                            while (!f || !f.items.length) {
                                f = 9 == d ? (f ? f.next : a.toolbar.next) || b.toolbox.toolbars[0] : (f ? f.previous : a.toolbar.previous) || b.toolbox.toolbars[b.toolbox.toolbars.length - 1];
                                if (f.items.length) {
                                    a = f.items[c ? f.items.length - 1 : 0];
                                    while (a && !a.focus) {
                                        a = c ? a.previous : a.next;
                                        if (!a) f = 0;
                                    }
                                }
                            }
                            if (a) a.focus();
                            return false;

                        case h ? 37 : 39:
                        case 40:
                            e = a;
                            do {
                                e = e.next;
                                if (!e && i) e = a.toolbar.items[0];
                            } while (e && !e.focus);
                            if (e) e.focus(); else g(a, 9);
                            return false;

                        case h ? 39 : 37:
                        case 38:
                            e = a;
                            do {
                                e = e.previous;
                                if (!e && i) e = a.toolbar.items[a.toolbar.items.length - 1];
                            } while (e && !e.focus);
                            if (e) e.focus(); else {
                                c = 1;
                                g(a, 2228224 + 9);
                                c = 0;
                            }
                            return false;

                        case 27:
                            b.focus();
                            return false;

                        case 13:
                        case 32:
                            a.execute();
                            return false;
                    }
                    return true;
                };
                b.on("themeSpace", function (c) {
                    if (c.data.space == b.config.toolbarLocation) {
                        b.toolbox = new d();
                        var f = e.getNextId(), h = ['<div class="cke_toolbox" role="group" aria-labelledby="', f, '" onmousedown="return false;"'], i = false !== b.config.toolbarStartupExpanded, j;
                        h.push(i ? ">" : ' style="display:none">');
                        h.push('<span id="', f, '" class="cke_voice_label">', b.lang.toolbars, "</span>");
                        var k = b.toolbox.toolbars, l = b.config.toolbar instanceof Array ? b.config.toolbar : b.config["toolbar_" + b.config.toolbar];
                        for (var m = 0; m < l.length; m++) {
                            var n, o = 0, p, q = l[m], r;
                            if (!q) continue;
                            if (j) {
                                h.push("</div>");
                                j = 0;
                            }
                            if ("/" === q) {
                                h.push('<div class="cke_break"></div>');
                                continue;
                            }
                            r = q.items || q;
                            for (var s = 0; s < r.length; s++) {
                                var t, u = r[s], v;
                                t = b.ui.create(u);
                                if (t) {
                                    v = false !== t.canGroup;
                                    if (!o) {
                                        n = e.getNextId();
                                        o = {
                                            id: n,
                                            items: []
                                        };
                                        p = q.name && (b.lang.toolbarGroups[q.name] || q.name);
                                        h.push('<span id="', n, '" class="cke_toolbar"', p ? ' aria-labelledby="' + n + '_label"' : "", ' role="toolbar">');
                                        p && h.push('<span id="', n, '_label" class="cke_voice_label">', p, "</span>");
                                        h.push('<span class="cke_toolbar_start"></span>');
                                        var w = k.push(o) - 1;
                                        if (w > 0) {
                                            o.previous = k[w - 1];
                                            o.previous.next = o;
                                        }
                                    }
                                    if (v) {
                                        if (!j) {
                                            h.push('<span class="cke_toolgroup" role="presentation">');
                                            j = 1;
                                        }
                                    } else if (j) {
                                        h.push("</span>");
                                        j = 0;
                                    }
                                    var x = t.render(b, h);
                                    w = o.items.push(x) - 1;
                                    if (w > 0) {
                                        x.previous = o.items[w - 1];
                                        x.previous.next = x;
                                    }
                                    x.toolbar = o;
                                    x.onkey = g;
                                    x.onfocus = function () {
                                        if (!b.toolbox.focusCommandExecuted) b.focus();
                                    };
                                }
                            }
                            if (j) {
                                h.push("</span>");
                                j = 0;
                            }
                            if (o) h.push('<span class="cke_toolbar_end"></span></span>');
                        }
                        h.push("</div>");
                        if (b.config.toolbarCanCollapse) {
                            var y = e.addFunction(function () {
                                b.execCommand("toolbarCollapse");
                            });
                            b.on("destroy", function () {
                                e.removeFunction(y);
                            });
                            var z = e.getNextId();
                            b.addCommand("toolbarCollapse", {
                                readOnly: 1,
                                exec: function (b) {
                                    var c = a.document.getById(z), d = c.getPrevious(), e = b.getThemeSpace("contents"), f = d.getParent(), g = parseInt(e.$.style.height, 10), h = f.$.offsetHeight, i = !d.isVisible();
                                    if (!i) {
                                        d.hide();
                                        c.addClass("cke_toolbox_collapser_min");
                                        c.setAttribute("title", b.lang.toolbarExpand);
                                    } else {
                                        d.show();
                                        c.removeClass("cke_toolbox_collapser_min");
                                        c.setAttribute("title", b.lang.toolbarCollapse);
                                    }
                                    c.getFirst().setText(i ? "▲" : "◀");
                                    var j = f.$.offsetHeight - h;
                                    e.setStyle("height", g - j + "px");
                                    b.fire("resize");
                                },
                                modes: {
                                    wysiwyg: 1,
                                    source: 1
                                }
                            });
                            h.push('<a title="' + (i ? b.lang.toolbarCollapse : b.lang.toolbarExpand) + '" id="' + z + '" tabIndex="-1" class="cke_toolbox_collapser');
                            if (!i) h.push(" cke_toolbox_collapser_min");
                            h.push('" onclick="CKEDITOR.tools.callFunction(' + y + ')">', "<span>&#9650;</span>", "</a>");
                        }
                        c.data.html += h.join("");
                    }
                });
                b.on("destroy", function () {
                    var a, b = 0, c, d, f;
                    a = this.toolbox.toolbars;
                    for (; b < a.length; b++) {
                        d = a[b].items;
                        for (c = 0; c < d.length; c++) {
                            f = d[c];
                            if (f.clickFn) e.removeFunction(f.clickFn);
                            if (f.keyDownFn) e.removeFunction(f.keyDownFn);
                        }
                    }
                });
                b.addCommand("toolbarFocus", f.toolbarFocus);
                b.ui.add("-", a.UI_SEPARATOR, {});
                b.ui.addHandler(a.UI_SEPARATOR, {
                    create: function () {
                        return {
                            render: function (a, b) {
                                b.push('<span class="cke_separator" role="separator"></span>');
                                return {};
                            }
                        };
                    }
                });
            }
        });
    }();
    a.UI_SEPARATOR = "separator";
    i.toolbarLocation = "top";
    i.toolbar_Basic = [["Bold", "Italic", "-", "NumberedList", "BulletedList", "-", "Link", "Unlink", "-", "About"]];
    i.toolbar_Edit = [{
        name: "basicstyles",
        items: ["Bold", "Italic", "Underline", "Strike", "Subscript", "Superscript", "-", "RemoveFormat"]
    },{
        name: "clipboard",
        items: ["Cut", "Copy", "Paste", "PasteText", "PasteFromWord", "-", "Undo", "Redo"]
    },{
        name: "paragraph",
        items: ["NumberedList", "BulletedList", "-", "Outdent", "Indent", "-", "Blockquote", "CreateDiv", "-", "JustifyLeft", "JustifyCenter", "JustifyRight", "JustifyBlock", "-", "BidiLtr", "BidiRtl"]
    },{
        name: "styles",
        items: ["Styles", "Format", "Font", "FontSize"]
        }];
    i.tollbar = "Edit";
    i.toolbar_Full = [{
        name: "document",
        items: ["Source", "-", "Save", "NewPage", "DocProps", "Preview", "Print", "-", "Templates"]
    }, {
        name: "clipboard",
        items: ["Cut", "Copy", "Paste", "PasteText", "PasteFromWord", "-", "Undo", "Redo"]
    }, {
        name: "editing",
        items: ["Find", "Replace", "-", "SelectAll", "-", "SpellChecker", "Scayt"]
    }, {
        name: "forms",
        items: ["Form", "Checkbox", "Radio", "TextField", "Textarea", "Select", "Button", "ImageButton", "HiddenField"]
    }, "/", {
        name: "basicstyles",
        items: ["Bold", "Italic", "Underline", "Strike", "Subscript", "Superscript", "-", "RemoveFormat"]
    }, {
        name: "paragraph",
        items: ["NumberedList", "BulletedList", "-", "Outdent", "Indent", "-", "Blockquote", "CreateDiv", "-", "JustifyLeft", "JustifyCenter", "JustifyRight", "JustifyBlock", "-", "BidiLtr", "BidiRtl"]
    }, {
        name: "links",
        items: ["Link", "Unlink", "Anchor"]
    }, {
        name: "insert",
        items: ["Image", "Flash", "Table", "HorizontalRule", "Smiley", "SpecialChar", "PageBreak", "Iframe"]
    }, "/", {
        name: "styles",
        items: ["Styles", "Format", "Font", "FontSize"]
    }, {
        name: "colors",
        items: ["TextColor", "BGColor"]
    }, {
        name: "tools",
        items: ["Maximize", "ShowBlocks", "-", "About"]
    }];
    i.toolbar = "Full";
    i.toolbarCanCollapse = true;
    !function () {
        j.add("undo", {
            requires: ["selection", "wysiwygarea"],
            init: function (a) {
                var b = new f(a), c = a.addCommand("undo", {
                    exec: function () {
                        if (b.undo()) {
                            a.selectionChange();
                            this.fire("afterUndo");
                        }
                    },
                    state: 0,
                    canUndo: false
                }), d = a.addCommand("redo", {
                    exec: function () {
                        if (b.redo()) {
                            a.selectionChange();
                            this.fire("afterRedo");
                        }
                    },
                    state: 0,
                    canUndo: false
                });
                b.onChange = function () {
                    c.setState(b.undoable() ? 2 : 0);
                    d.setState(b.redoable() ? 2 : 0);
                };
                function e(a) {
                    if (b.enabled && false !== a.data.command.canUndo) b.save();
                }
                a.on("beforeCommandExec", e);
                a.on("afterCommandExec", e);
                a.on("saveSnapshot", function (a) {
                    b.save(a.data && a.data.contentOnly);
                });
                a.on("contentDom", function () {
                    a.document.on("keydown", function (a) {
                        if (!a.data.$.ctrlKey && !a.data.$.metaKey) b.type(a);
                    });
                });
                a.on("beforeModeUnload", function () {
                    "wysiwyg" == a.mode && b.save(true);
                });
                a.on("mode", function () {
                    b.enabled = a.readOnly ? false : "wysiwyg" == a.mode;
                    b.onChange();
                });
                a.ui.addButton("Undo", {
                    label: a.lang.undo,
                    command: "undo"
                });
                a.ui.addButton("Redo", {
                    label: a.lang.redo,
                    command: "redo"
                });
                a.resetUndo = function () {
                    b.reset();
                    a.fire("saveSnapshot");
                };
                a.on("updateSnapshot", function () {
                    if (b.currentImage) b.update();
                });
            }
        });
        j.undo = {};
        var a = j.undo.Image = function (a) {
            this.editor = a;
            a.fire("beforeUndoImage");
            var b = a.getSnapshot(), d = b && a.getSelection();
            c && b && (b = b.replace(/\s+data-cke-expando=".*?"/g, ""));
            this.contents = b;
            this.bookmarks = d && d.createBookmarks2(true);
            a.fire("afterUndoImage");
        }, d = /\b(?:href|src|name)="[^"]*?"/gi;
        a.prototype = {
            equals: function (a, f) {
                var g = this.contents, h = a.contents;
                if (c && (b.ie7Compat || b.ie6Compat)) {
                    g = g.replace(d, "");
                    h = h.replace(d, "");
                }
                if (g != h) return false;
                if (f) return true;
                var i = this.bookmarks, j = a.bookmarks;
                if (i || j) {
                    if (!i || !j || i.length != j.length) return false;
                    for (var k = 0; k < i.length; k++) {
                        var l = i[k], m = j[k];
                        if (l.startOffset != m.startOffset || l.endOffset != m.endOffset || !e.arrayCompare(l.start, m.start) || !e.arrayCompare(l.end, m.end)) return false;
                    }
                }
                return true;
            }
        };
        function f(a) {
            this.editor = a;
            this.reset();
        }
        var g = {
            8: 1,
            46: 1
        }, h = {
            16: 1,
            17: 1,
            18: 1
        }, i = {
            37: 1,
            38: 1,
            39: 1,
            40: 1
        };
        f.prototype = {
            type: function (b) {
                var d = b && b.data.getKey(), f = d in h, j = d in g, k = this.lastKeystroke in g, l = j && d == this.lastKeystroke, m = d in i, n = this.lastKeystroke in i, o = !j && !m, p = j && !l, q = !(f || this.typing) || o && (k || n);
                if (q || p) {
                    var r = new a(this.editor), s = this.snapshots.length;
                    e.setTimeout(function () {
                        var a = this;
                        var b = a.editor.getSnapshot();
                        if (c) b = b.replace(/\s+data-cke-expando=".*?"/g, "");
                        if (r.contents != b && s == a.snapshots.length) {
                            a.typing = true;
                            if (!a.save(false, r, false)) a.snapshots.splice(a.index + 1, a.snapshots.length - a.index - 1);
                            a.hasUndo = true;
                            a.hasRedo = false;
                            a.typesCount = 1;
                            a.modifiersCount = 1;
                            a.onChange();
                        }
                    }, 0, this);
                }
                this.lastKeystroke = d;
                if (j) {
                    this.typesCount = 0;
                    this.modifiersCount++;
                    if (this.modifiersCount > 25) {
                        this.save(false, null, false);
                        this.modifiersCount = 1;
                    }
                } else if (!m) {
                    this.modifiersCount = 0;
                    this.typesCount++;
                    if (this.typesCount > 25) {
                        this.save(false, null, false);
                        this.typesCount = 1;
                    }
                }
            },
            reset: function () {
                var a = this;
                a.lastKeystroke = 0;
                a.snapshots = [];
                a.index = -1;
                a.limit = a.editor.config.undoStackSize || 20;
                a.currentImage = null;
                a.hasUndo = false;
                a.hasRedo = false;
                a.resetType();
            },
            resetType: function () {
                var a = this;
                a.typing = false;
                delete a.lastKeystroke;
                a.typesCount = 0;
                a.modifiersCount = 0;
            },
            fireChange: function () {
                var a = this;
                a.hasUndo = !!a.getNextImage(true);
                a.hasRedo = !!a.getNextImage(false);
                a.resetType();
                a.onChange();
            },
            save: function (b, c, d) {
                var e = this;
                var f = e.snapshots;
                if (!c) c = new a(e.editor);
                if (false === c.contents) return false;
                if (e.currentImage && c.equals(e.currentImage, b)) return false;
                f.splice(e.index + 1, f.length - e.index - 1);
                if (f.length == e.limit) f.shift();
                e.index = f.push(c) - 1;
                e.currentImage = c;
                if (false !== d) e.fireChange();
                return true;
            },
            restoreImage: function (a) {
                var b = this;
                var d = b.editor, e;
                if (a.bookmarks) {
                    d.focus();
                    e = d.getSelection();
                }
                b.editor.loadSnapshot(a.contents);
                if (a.bookmarks) e.selectBookmarks(a.bookmarks); else if (c) {
                    var f = b.editor.document.getBody().$.createTextRange();
                    f.collapse(true);
                    f.select();
                }
                b.index = a.index;
                b.update();
                b.fireChange();
            },
            getNextImage: function (a) {
                var b = this;
                var c = b.snapshots, d = b.currentImage, e, f;
                if (d) if (a) for (f = b.index - 1; f >= 0; f--) {
                    e = c[f];
                    if (!d.equals(e, true)) {
                        e.index = f;
                        return e;
                    }
                } else for (f = b.index + 1; f < c.length; f++) {
                    e = c[f];
                    if (!d.equals(e, true)) {
                        e.index = f;
                        return e;
                    }
                }
                return null;
            },
            redoable: function () {
                return this.enabled && this.hasRedo;
            },
            undoable: function () {
                return this.enabled && this.hasUndo;
            },
            undo: function () {
                var a = this;
                if (a.undoable()) {
                    a.save(true);
                    var b = a.getNextImage(true);
                    if (b) return a.restoreImage(b), true;
                }
                return false;
            },
            redo: function () {
                var a = this;
                if (a.redoable()) {
                    a.save(true);
                    if (a.redoable()) {
                        var b = a.getNextImage(false);
                        if (b) return a.restoreImage(b), true;
                    }
                }
                return false;
            },
            update: function () {
                var b = this;
                b.snapshots.splice(b.index, 1, b.currentImage = new a(b.editor));
            }
        };
    }();
    !function () {
        var i = /(^|<body\b[^>]*>)\s*<(p|div|address|h\d|center|pre)[^>]*>\s*(?:<br[^>]*>|&nbsp;|\u00A0|&#160;)?\s*(:?<\/\2>)?\s*(?=$|<\/body>)/gi, k = d.walker.whitespaces(true), l = d.walker.bogus(true), m = function (a) {
            return k(a) && l(a);
        };
        function n(a) {
            return a.isBlockBoundary() && f.$empty[a.getName()];
        }
        function o(a) {
            return function (b) {
                if ("wysiwyg" == this.mode) {
                    this.focus();
                    var c = this.getSelection(), d = c.isLocked;
                    d && c.unlock();
                    this.fire("saveSnapshot");
                    a.call(this, b.data);
                    d && this.getSelection().lock();
                    var e = this;
                    setTimeout(function () {
                        try {
                            e.fire("saveSnapshot");
                        } catch (a) {
                            setTimeout(function () {
                                e.fire("saveSnapshot");
                            }, 200);
                        }
                    }, 0);
                }
            };
        }
        function p(e) {
            var f = this;
            if (f.dataProcessor) e = f.dataProcessor.toHtml(e);
            if (!e) return;
            var g = f.getSelection(), h = g.getRanges()[0];
            if (h.checkReadOnly()) return;
            if (b.opera) {
                var i = new d.elementPath(h.startContainer);
                if (i.block) {
                    var j = a.htmlParser.fragment.fromHtml(e, false).children;
                    for (var k = 0, l = j.length; k < l; k++) if (j[k]._.isBlockLike) {
                        h.splitBlock(3 == f.enterMode ? "div" : "p");
                        h.insertNode(h.document.createText(""));
                        h.select();
                        break;
                    }
                }
            }
            if (c) {
                var m = g.getNative();
                if ("Control" == m.type) m.clear(); else if (2 == g.getType()) {
                    h = g.getRanges()[0];
                    var n = h && h.endContainer;
                    if (n && 1 == n.type && "false" == n.getAttribute("contenteditable") && h.checkBoundaryOfElement(n, 2)) {
                        h.setEndAfter(h.endContainer);
                        h.deleteContents();
                    }
                }
                m.createRange().pasteHTML(e);
            } else f.document.$.execCommand("inserthtml", false, e);
            if (b.webkit) {
                g = f.getSelection();
                g.scrollIntoView();
            }
        }
        function q(a) {
            var g = this.getSelection(), h = g.getStartElement().hasAscendant("pre", true) ? 2 : this.config.enterMode, i = 2 == h, j = e.htmlEncode(a.replace(/\r\n|\r/g, "\n"));
            j = j.replace(/^[ \t]+|[ \t]+$/g, function (a, b, c) {
                if (1 == a.length) return "&nbsp;"; else if (!b) return e.repeat("&nbsp;", a.length - 1) + " "; else return " " + e.repeat("&nbsp;", a.length - 1);
            });
            j = j.replace(/[ \t]{2,}/g, function (a) {
                return e.repeat("&nbsp;", a.length - 1) + " ";
            });
            var k = 1 == h ? "p" : "div";
            if (!i) j = j.replace(/(\n{2})([\s\S]*?)(?:$|\1)/g, function (a, b, c) {
                return "<" + k + ">" + c + "</" + k + ">";
            });
            j = j.replace(/\n/g, "<br>");
            if (!(i || c)) j = j.replace(new RegExp("<br>(?=</" + k + ">)"), function (a) {
                return e.repeat(a, 2);
            });
            if (b.gecko || b.webkit) {
                var l = new d.elementPath(g.getStartElement()), m = [];
                for (var n = 0; n < l.elements.length; n++) {
                    var o = l.elements[n].getName();
                    if (o in f.$inline) m.unshift(l.elements[n].getOuterHtml().match(/^<.*?>/)); else if (o in f.$block) break;
                }
                j = m.join("") + j;
            }
            p.call(this, j);
        }
        function r(a) {
            var b = this.getSelection(), c = b.getRanges(), d = a.getName(), e = f.$block[d], g = b.isLocked;
            if (g) b.unlock();
            var h, i, j, k;
            for (var l = c.length - 1; l >= 0; l--) {
                h = c[l];
                if (!h.checkReadOnly()) {
                    h.deleteContents(1);
                    i = !l && a || a.clone(1);
                    var n, o;
                    if (e) while ((n = h.getCommonAncestor(0, 1)) && (o = f[n.getName()]) && !(o && o[d])) if (n.getName() in f.span) h.splitElement(n); else if (h.checkStartOfBlock() && h.checkEndOfBlock()) {
                        h.setStartBefore(n);
                        h.collapse(true);
                        n.remove();
                    } else h.splitBlock();
                    h.insertNode(i);
                    if (!j) j = i;
                }
            }
            if (j) {
                h.moveToPosition(j, 4);
                if (e) {
                    var p = j.getNext(m), q = p && 1 == p.type && p.getName();
                    if (q && f.$block[q]) if (f[q]["#"]) h.moveToElementEditStart(p); else h.moveToElementEditEnd(j); else if (!p) {
                        p = h.fixBlock(true, 3 == this.config.enterMode ? "div" : "p");
                        h.moveToElementEditStart(p);
                    }
                }
            }
            b.selectRanges([h]);
            if (g) this.getSelection().lock();
        }
        function s(a) {
            if (!a.checkDirty()) setTimeout(function () {
                a.resetDirty();
            }, 0);
        }
        var t = d.walker.whitespaces(true), u = d.walker.bookmark(false, true);
        function v(a) {
            return t(a) && u(a);
        }
        function w(a) {
            return 3 == a.type && e.trim(a.getText()).match(/^(?:&nbsp;|\xa0)$/);
        }
        function x(a) {
            if (a.isLocked) {
                a.unlock();
                setTimeout(function () {
                    a.lock();
                }, 0);
            }
        }
        function y(a) {
            return a.getOuterHtml().match(i);
        }
        t = d.walker.whitespaces(true);
        function z(a) {
            var b = a.window, c = a.document, e = a.document.getBody(), f = e.getFirst(), g = e.getChildren().count();
            if (!g || 1 == g && 1 == f.type && f.hasAttribute("_moz_editor_bogus_node")) {
                s(a);
                var h = a.element.getDocument(), i = h.getDocumentElement(), j = i.$.scrollTop, k = i.$.scrollLeft, l = c.$.createEvent("KeyEvents");
                l.initKeyEvent("keypress", true, true, b.$, false, false, false, false, 0, 32);
                c.$.dispatchEvent(l);
                if (j != i.$.scrollTop || k != i.$.scrollLeft) h.getWindow().$.scrollTo(k, j);
                g && e.getFirst().remove();
                c.getBody().appendBogus();
                var m = new d.range(c);
                m.setStartAt(e, 1);
                m.select();
            }
        }
        function A(a) {
            var e = a.editor, f = a.data.path, g = f.blockLimit, h = a.data.selection, i = h.getRanges()[0], j = e.document.getBody(), k = e.config.enterMode;
            if (b.gecko) {
                var l = f.block || f.blockLimit, m = l && l.getLast(v);
                if (l && l.isBlockBoundary() && !(m && 1 == m.type && m.isBlockBoundary()) && !l.is("pre") && !l.getBogus()) l.appendBogus();
            }
            if (false !== e.config.autoParagraph && 2 != k && i.collapsed && "body" == g.getName() && !f.block) {
                var o = i.fixBlock(true, 3 == e.config.enterMode ? "div" : "p");
                if (c) {
                    var p = o.getFirst(v);
                    p && w(p) && p.remove();
                }
                if (y(o)) {
                    var q = o.getNext(t);
                    if (q && 1 == q.type && !n(q)) {
                        i.moveToElementEditStart(q);
                        o.remove();
                    } else {
                        q = o.getPrevious(t);
                        if (q && 1 == q.type && !n(q)) {
                            i.moveToElementEditEnd(q);
                            o.remove();
                        }
                    }
                }
                i.select();
                a.cancel();
            }
            var r = new d.range(e.document);
            r.moveToElementEditEnd(e.document.getBody());
            var s = new d.elementPath(r.startContainer);
            if (!s.blockLimit.is("body")) {
                var u;
                if (2 != k) u = j.append(e.document.createElement(1 == k ? "p" : "div")); else u = j;
                if (!c) u.appendBogus();
            }
        }
        j.add("wysiwygarea", {
            requires: ["editingblock"],
            init: function (j) {
                var l = 2 != j.config.enterMode && false !== j.config.autoParagraph ? 3 == j.config.enterMode ? "div" : "p" : false, m = j.lang.editorTitle.replace("%1", j.name), n = j.lang.editorHelp;
                if (c) m += ", " + n;
                var s = a.document.getWindow(), t;
                j.on("editingBlockReady", function () {
                    var f, u, v, w, x, y, B, C = b.isCustomDomain(), D = function (d) {
                        if (u) u.remove();
                        var g = "document.open();" + (C ? 'document.domain="' + document.domain + '";' : "") + "document.close();";
                        g = b.air ? "javascript:void(0)" : c ? "javascript:void(function(){" + encodeURIComponent(g) + "}())" : "";
                        var i = e.getNextId();
                        u = h.createFromHtml('<iframe style="width:100%;height:100%" frameBorder="0" aria-describedby="' + i + '"' + ' title="' + m + '"' + ' src="' + g + '"' + ' tabIndex="' + (b.webkit ? -1 : j.tabIndex) + '"' + ' allowTransparency="true"' + "></iframe>");
                        if ("chrome:" == document.location.protocol) a.event.useCapture = true;
                        u.on("load", function (a) {
                            x = 1;
                            a.removeListener();
                            var c = u.getFrameDocument();
                            c.write(d);
                            b.air && F(c.getWindow().$);
                        });
                        if ("chrome:" == document.location.protocol) a.event.useCapture = false;
                        f.append(h.createFromHtml('<span id="' + i + '" class="cke_voice_label">' + n + "</span>"));
                        f.append(u);
                        if (b.webkit) {
                            B = function () {
                                f.setStyle("width", "100%");
                                u.hide();
                                u.setSize("width", f.getSize("width"));
                                f.removeStyle("width");
                                u.show();
                            };
                            s.on("resize", B);
                        }
                    };
                    t = e.addFunction(F);
                    var E = '<script id="cke_actscrpt" type="text/javascript" data-cke-temp="1">' + (C ? 'document.domain="' + document.domain + '";' : "") + "window.parent.CKEDITOR.tools.callFunction( " + t + ", window );" + "</script>";
                    function F(a) {
                        if (!x) return;
                        x = 0;
                        j.fire("ariaWidget", u);
                        var f = a.document, h = f.body, l = f.getElementById("cke_actscrpt");
                        l && l.parentNode.removeChild(l);
                        h.spellcheck = !j.config.disableNativeSpellChecker;
                        var m = !j.readOnly;
                        if (c) {
                            h.hideFocus = true;
                            h.disabled = true;
                            h.contentEditable = m;
                            h.removeAttribute("disabled");
                        } else setTimeout(function () {
                            if (b.gecko && b.version >= 10900 || b.opera) f.$.body.contentEditable = m; else if (b.webkit) f.$.body.parentNode.contentEditable = m; else f.$.designMode = m ? "off" : "on";
                        }, 0);
                        m && b.gecko && e.setTimeout(z, 0, null, j);
                        a = j.window = new d.window(a);
                        f = j.document = new g(f);
                        m && f.on("dblclick", function (a) {
                            var b = a.data.getTarget(), c = {
                                element: b,
                                dialog: ""
                            };
                            j.fire("doubleclick", c);
                            c.dialog && j.openDialog(c.dialog);
                        });
                        c && f.on("click", function (a) {
                            var b = a.data.getTarget();
                            if (b.is("input")) {
                                var c = b.getAttribute("type");
                                if ("submit" == c || "reset" == c) a.data.preventDefault();
                            }
                        });
                        if (!(c || b.opera)) f.on("mousedown", function (a) {
                            var b = a.data.getTarget();
                            if (b.is("img", "hr", "input", "textarea", "select")) j.getSelection().selectElement(b);
                        });
                        if (b.gecko) f.on("mouseup", function (a) {
                            if (2 == a.data.$.button) {
                                var b = a.data.getTarget();
                                if (!b.getOuterHtml().replace(i, "")) {
                                    var c = new d.range(f);
                                    c.moveToElementEditStart(b);
                                    c.select(true);
                                }
                            }
                        });
                        f.on("click", function (a) {
                            a = a.data;
                            if (a.getTarget().is("a") && 2 != a.$.button) a.preventDefault();
                        });
                        if (b.webkit) {
                            f.on("mousedown", function () {
                                o = 1;
                            });
                            f.on("click", function (a) {
                                if (a.data.getTarget().is("input", "select")) a.data.preventDefault();
                            });
                            f.on("mouseup", function (a) {
                                if (a.data.getTarget().is("input", "textarea")) a.data.preventDefault();
                            });
                        }
                        var n = c ? u : a;
                        n.on("blur", function () {
                            j.focusManager.blur();
                        });
                        var o;
                        n.on("focus", function () {
                            var a = j.document;
                            if (b.gecko || b.opera) a.getBody().focus(); else if (b.webkit) if (!o) {
                                j.document.getDocumentElement().focus();
                                o = 1;
                            }
                            j.focusManager.focus();
                        });
                        var p = j.keystrokeHandler;
                        p.blockedKeystrokes[8] = !m;
                        p.attach(f);
                        f.getDocumentElement().addClass(f.$.compatMode);
                        j.on("key", function (c) {
                            if ("wysiwyg" != j.mode) return;
                            var e = c.data.keyCode;
                            if (e in {
                                8: 1,
                                46: 1
                            }) {
                                var g = j.getSelection(), h = g.getSelectedElement(), i = g.getRanges()[0], l = new d.elementPath(i.startContainer), m, n, o, p = 8 == e;
                                if (h) {
                                    j.fire("saveSnapshot");
                                    i.moveToPosition(h, 3);
                                    h.remove();
                                    i.select();
                                    j.fire("saveSnapshot");
                                    c.cancel();
                                } else if (i.collapsed) if ((m = l.block) && i[p ? "checkStartOfBlock" : "checkEndOfBlock"]() && (o = m[p ? "getPrevious" : "getNext"](k)) && o.is("table")) {
                                    j.fire("saveSnapshot");
                                    if (i[p ? "checkEndOfBlock" : "checkStartOfBlock"]()) m.remove();
                                    i["moveToElementEdit" + (p ? "End" : "Start")](o);
                                    i.select();
                                    j.fire("saveSnapshot");
                                    c.cancel();
                                } else if (l.blockLimit.is("td") && (n = l.blockLimit.getAscendant("table")) && i.checkBoundaryOfElement(n, p ? 1 : 2) && (o = n[p ? "getPrevious" : "getNext"](k))) {
                                    j.fire("saveSnapshot");
                                    i["moveToElementEdit" + (p ? "End" : "Start")](o);
                                    if (i.checkStartOfBlock() && i.checkEndOfBlock()) o.remove(); else i.select();
                                    j.fire("saveSnapshot");
                                    c.cancel();
                                }
                            }
                            if (33 == e || 34 == e) if (b.gecko) {
                                var q = f.getBody();
                                if (a.$.innerHeight > q.$.offsetHeight) {
                                    i = new d.range(f);
                                    i[33 == e ? "moveToElementEditStart" : "moveToElementEditEnd"](q);
                                    i.select();
                                    c.cancel();
                                }
                            }
                        });
                        if (c && "CSS1Compat" == f.$.compatMode) {
                            var q = {
                                33: 1,
                                34: 1
                            };
                            f.on("keydown", function (a) {
                                if (a.data.getKeystroke() in q) setTimeout(function () {
                                    j.getSelection().scrollIntoView();
                                }, 0);
                            });
                        }
                        if (c && 1 != j.config.enterMode) f.on("selectionchange", function () {
                            var a = f.getBody(), b = j.getSelection(), c = b && b.getRanges()[0];
                            if (c && a.getHtml().match(/^<p>&nbsp;<\/p>$/i) && c.startContainer.equals(a)) setTimeout(function () {
                                c = j.getSelection().getRanges()[0];
                                if (!c.startContainer.equals("body")) {
                                    a.getFirst().remove(1);
                                    c.moveToElementEditEnd(a);
                                    c.select(1);
                                }
                            }, 0);
                        });
                        if (j.contextMenu) j.contextMenu.addTarget(f, false !== j.config.browserContextMenuOnCtrl);
                        setTimeout(function () {
                            j.fire("contentDom");
                            if (y) {
                                j.mode = "wysiwyg";
                                j.fire("mode", {
                                    previousMode: j._.previousMode
                                });
                                y = false;
                            }
                            v = false;
                            if (w) {
                                j.focus();
                                w = false;
                            }
                            setTimeout(function () {
                                j.fire("dataReady");
                            }, 0);
                            try {
                                j.document.$.execCommand("2D-position", false, true);
                            } catch (a) { }
                            try {
                                j.document.$.execCommand("enableInlineTableEditing", false, !j.config.disableNativeTableHandles);
                            } catch (b) { }
                            if (j.config.disableObjectResizing) try {
                                j.document.$.execCommand("enableObjectResizing", false, false);
                            } catch (d) {
                                j.document.getBody().on(c ? "resizestart" : "resize", function (a) {
                                    a.data.preventDefault();
                                });
                            }
                            if (c) setTimeout(function () {
                                if (j.document) {
                                    var a = j.document.$.body;
                                    a.runtimeStyle.marginBottom = "0px";
                                    a.runtimeStyle.marginBottom = "";
                                }
                            }, 1e3);
                        }, 0);
                    }
                    j.addMode("wysiwyg", {
                        load: function (a, d, e) {
                            f = a;
                            if (c && b.quirks) a.setStyle("position", "relative");
                            j.mayBeDirty = true;
                            y = true;
                            if (e) this.loadSnapshotData(d); else this.loadData(d);
                        },
                        loadData: function (a) {
                            v = true;
                            j._.dataStore = {
                                id: 1
                            };
                            var c = j.config, d = c.fullPage, f = c.docType, g = '<style type="text/css" data-cke-temp="1">' + j._.styles.join("\n") + "</style>";
                            !d && (g = e.buildStyleHtml(j.config.contentsCss) + g);
                            var h = c.baseHref ? '<base href="' + c.baseHref + '" data-cke-temp="1" />' : "";
                            if (d) a = a.replace(/<!DOCTYPE[^>]*>/i, function (a) {
                                j.docType = f = a;
                                return "";
                            }).replace(/<\?xml\s[^\?]*\?>/i, function (a) {
                                j.xmlDeclaration = a;
                                return "";
                            });
                            if (j.dataProcessor) a = j.dataProcessor.toHtml(a, l);
                            if (d) {
                                if (!/<body[\s|>]/.test(a)) a = "<body>" + a;
                                if (!/<html[\s|>]/.test(a)) a = "<html>" + a + "</html>";
                                if (!/<head[\s|>]/.test(a)) a = a.replace(/<html[^>]*>/, "$&<head><title></title></head>"); else if (!/<title[\s|>]/.test(a)) a = a.replace(/<head[^>]*>/, "$&<title></title>");
                                h && (a = a.replace(/<head>/, "$&" + h));
                                a = a.replace(/<\/head\s*>/, g + "$&");
                                a = f + a;
                            } else a = c.docType + '<html dir="' + c.contentsLangDirection + '"' + ' lang="' + (c.contentsLanguage || j.langCode) + '">' + "<head>" + "<title>" + m + "</title>" + h + g + "</head>" + "<body" + (c.bodyId ? ' id="' + c.bodyId + '"' : "") + (c.bodyClass ? ' class="' + c.bodyClass + '"' : "") + ">" + a + "</html>";
                            if (b.gecko) a = a.replace(/<br \/>(?=\s*<\/(:?html|body)>)/, '$&<br type="_moz" />');
                            a += E;
                            this.onDispose();
                            D(a);
                        },
                        getData: function () {
                            var a = j.config, c = a.fullPage, d = c && j.docType, e = c && j.xmlDeclaration, f = u.getFrameDocument(), g = c ? f.getDocumentElement().getOuterHtml() : f.getBody().getHtml();
                            if (b.gecko) g = g.replace(/<br>(?=\s*(:?$|<\/body>))/, "");
                            if (j.dataProcessor) g = j.dataProcessor.toDataFormat(g, l);
                            if (a.ignoreEmptyParagraph) g = g.replace(i, function (a, b) {
                                return b;
                            });
                            if (e) g = e + "\n" + g;
                            if (d) g = d + "\n" + g;
                            return g;
                        },
                        getSnapshotData: function () {
                            return u.getFrameDocument().getBody().getHtml();
                        },
                        loadSnapshotData: function (a) {
                            u.getFrameDocument().getBody().setHtml(a);
                        },
                        onDispose: function () {
                            if (!j.document) return;
                            j.document.getDocumentElement().clearCustomData();
                            j.document.getBody().clearCustomData();
                            j.window.clearCustomData();
                            j.document.clearCustomData();
                            u.clearCustomData();
                            u.remove();
                        },
                        unload: function (a) {
                            this.onDispose();
                            if (B) s.removeListener("resize", B);
                            j.window = j.document = u = f = w = null;
                            j.fire("contentDomUnload");
                        },
                        focus: function () {
                            var a = j.window;
                            if (v) w = true; else if (a) {
                                var c = j.getSelection(), d = c && c.getNative();
                                if (d && "Control" == d.type) return;
                                b.air ? setTimeout(function () {
                                    a.focus();
                                }, 0) : a.focus();
                                j.selectionChange();
                            }
                        }
                    });
                    j.on("insertHtml", o(p), null, null, 20);
                    j.on("insertElement", o(r), null, null, 20);
                    j.on("insertText", o(q), null, null, 20);
                    j.on("selectionChange", function (a) {
                        if (j.readOnly) return;
                        var b = j.getSelection();
                        if (b && !b.isLocked) {
                            var c = j.checkDirty();
                            j.fire("saveSnapshot", {
                                contentOnly: 1
                            });
                            A.call(this, a);
                            j.fire("updateSnapshot");
                            !c && j.resetDirty();
                        }
                    }, null, null, 1);
                });
                j.on("contentDom", function () {
                    var a = j.document.getElementsByTag("title").getItem(0);
                    a.data("cke-title", j.document.$.title);
                    c && (j.document.$.title = m);
                });
                j.on("readOnly", function () {
                    if ("wysiwyg" == j.mode) {
                        var a = j.getMode();
                        a.loadData(a.getData());
                    }
                });
                if (a.document.$.documentMode >= 8) {
                    j.addCss("html.CSS1Compat [contenteditable=false]{ min-height:0 !important;}");
                    var u = [];
                    for (var v in f.$removeEmpty) u.push("html.CSS1Compat " + v + "[contenteditable=false]");
                    j.addCss(u.join(",") + "{ display:inline-block;}");
                } else if (b.gecko) {
                    j.addCss("html { height: 100% !important; }");
                    j.addCss("img:-moz-broken { -moz-force-broken-image-icon : 1;	min-width : 24px; min-height : 24px; }");
                }
                j.addCss("html {	_overflow-y: scroll; cursor: text;	*cursor:auto;}");
                j.addCss("img, input, textarea { cursor: default;}");
                j.on("insertElement", function (a) {
                    var b = a.data;
                    if (1 == b.type && (b.is("input") || b.is("textarea"))) {
                        var c = "false" == b.getAttribute("contenteditable");
                        if (!c) {
                            b.data("cke-editable", b.hasAttribute("contenteditable") ? "true" : "1");
                            b.setAttribute("contenteditable", false);
                        }
                    }
                });
            }
        });
        if (b.gecko) (function () {
            var a = document.body;
            if (!a) window.addEventListener("load", arguments.callee, false); else {
                var b = a.getAttribute("onpageshow");
                a.setAttribute("onpageshow", (b ? b + ";" : "") + "event.persisted && (function(){" + "var allInstances = CKEDITOR.instances, editor, doc;" + "for ( var i in allInstances )" + "{" + "	editor = allInstances[ i ];" + "	doc = editor.document;" + "	if ( doc )" + "	{" + '		doc.$.designMode = "off";' + '		doc.$.designMode = "on";' + "	}" + "}" + "})();");
            }
        })();
    }();
    i.disableObjectResizing = false;
    i.disableNativeTableHandles = true;
    i.disableNativeSpellChecker = true;
    i.ignoreEmptyParagraph = true;
    j.add("wsc", {
        requires: ["dialog"],
        init: function (c) {
            var d = "checkspell", e = c.addCommand(d, new a.dialogCommand(d));
            e.modes = {
                wysiwyg: !b.opera && !b.air && document.domain == window.location.hostname
            };
            c.ui.addButton("SpellChecker", {
                label: c.lang.spellCheck.toolbar,
                command: d
            });
            a.dialog.add(d, this.path + "dialogs/wsc.js");
        }
    });
    i.wsc_customerId = i.wsc_customerId || "1:ua3xw1-2XyGJ3-GWruD3-6OFNT1-oXcuB1-nR6Bp4-hgQHc-EcYng3-sdRXG3-NOfFk";
    i.wsc_customLoaderScript = i.wsc_customLoaderScript || null;
    a.DIALOG_RESIZE_NONE = 0;
    a.DIALOG_RESIZE_WIDTH = 1;
    a.DIALOG_RESIZE_HEIGHT = 2;
    a.DIALOG_RESIZE_BOTH = 3;
    !function () {
        var f = e.cssLength;
        function i(a) {
            return !!this._.tabs[a][0].$.offsetHeight;
        }
        function j() {
            var a = this;
            var b = a._.currentTabId, c = a._.tabIdList.length, d = e.indexOf(a._.tabIdList, b) + c;
            for (var f = d - 1; f > d - c; f--) if (i.call(a, a._.tabIdList[f % c])) return a._.tabIdList[f % c];
            return null;
        }
        function l() {
            var a = this;
            var b = a._.currentTabId, c = a._.tabIdList.length, d = e.indexOf(a._.tabIdList, b);
            for (var f = d + 1; f < d + c; f++) if (i.call(a, a._.tabIdList[f % c])) return a._.tabIdList[f % c];
            return null;
        }
        function m(a, b) {
            var c = a.$.getElementsByTagName("input");
            for (var d = 0, e = c.length; d < e; d++) {
                var f = new h(c[d]);
                if ("text" == f.getAttribute("type").toLowerCase()) if (b) {
                    f.setAttribute("value", f.getCustomData("fake_value") || "");
                    f.removeCustomData("fake_value");
                } else {
                    f.setCustomData("fake_value", f.getAttribute("value"));
                    f.setAttribute("value", "");
                }
            }
        }
        function n(a, b) {
            var c = this;
            var d = c.getInputElement();
            if (d) a ? d.removeAttribute("aria-invalid") : d.setAttribute("aria-invalid", true);
            if (!a) if (c.select) c.select(); else c.focus();
            b && alert(b);
            c.fire("validated", {
                valid: a,
                msg: b
            });
        }
        function o() {
            var a = this.getInputElement();
            a && a.removeAttribute("aria-invalid");
        }
        a.dialog = function (f, h) {
            var i = a.dialog._.dialogDefinitions[h], k = e.clone(r), m = f.config.dialog_buttonsOrder || "OS", p = f.lang.dir, q = {}, s, t, u;
            if ("OS" == m && b.mac || "rtl" == m && "ltr" == p || "ltr" == m && "rtl" == p) k.buttons.reverse();
            i = e.extend(i(f), k);
            i = e.clone(i);
            i = new v(this, i);
            var w = a.document, z = f.theme.buildDialog(f);
            this._ = {
                editor: f,
                element: z.element,
                name: h,
                contentSize: {
                    width: 0,
                    height: 0
                },
                size: {
                    width: 0,
                    height: 0
                },
                contents: {},
                buttons: {},
                accessKeyMap: {},
                tabs: {},
                tabIdList: [],
                currentTabId: null,
                currentTabIndex: null,
                pageCount: 0,
                lastTab: null,
                tabBarMode: false,
                focusList: [],
                currentFocusIndex: 0,
                hasFocus: false
            };
            this.parts = z.parts;
            e.setTimeout(function () {
                f.fire("ariaWidget", this.parts.contents);
            }, 0, this);
            var A = {
                position: b.ie6Compat ? "absolute" : "fixed",
                top: 0,
                visibility: "hidden"
            };
            A["rtl" == p ? "right" : "left"] = 0;
            this.parts.dialog.setStyles(A);
            a.event.call(this);
            this.definition = i = a.fire("dialogDefinition", {
                name: h,
                definition: i
            }, f).definition;
            if (!("removeDialogTabs" in f._) && f.config.removeDialogTabs) {
                var B = f.config.removeDialogTabs.split(";");
                for (s = 0; s < B.length; s++) {
                    var C = B[s].split(":");
                    if (2 == C.length) {
                        var D = C[0];
                        if (!q[D]) q[D] = [];
                        q[D].push(C[1]);
                    }
                }
                f._.removeDialogTabs = q;
            }
            if (f._.removeDialogTabs && (q = f._.removeDialogTabs[h])) for (s = 0; s < q.length; s++) i.removeContents(q[s]);
            if (i.onLoad) this.on("load", i.onLoad);
            if (i.onShow) this.on("show", i.onShow);
            if (i.onHide) this.on("hide", i.onHide);
            if (i.onOk) this.on("ok", function (a) {
                f.fire("saveSnapshot");
                setTimeout(function () {
                    f.fire("saveSnapshot");
                }, 0);
                if (false === i.onOk.call(this, a)) a.data.hide = false;
            });
            if (i.onCancel) this.on("cancel", function (a) {
                if (false === i.onCancel.call(this, a)) a.data.hide = false;
            });
            var E = this, F = function (a) {
                var b = E._.contents, c = false;
                for (var d in b) for (var e in b[d]) {
                    c = a.call(this, b[d][e]);
                    if (c) return;
                }
            };
            this.on("ok", function (a) {
                F(function (b) {
                    if (b.validate) {
                        var c = b.validate(this), d = "string" == typeof c || false === c;
                        if (d) {
                            a.data.hide = false;
                            a.stop();
                        }
                        n.call(b, !d, "string" == typeof c ? c : void 0);
                        return d;
                    }
                });
            }, this, null, 0);
            this.on("cancel", function (a) {
                F(function (b) {
                    if (b.isChanged()) {
                        if (!confirm(f.lang.common.confirmCancel)) a.data.hide = false;
                        return true;
                    }
                });
            }, this, null, 0);
            this.parts.close.on("click", function (a) {
                if (false !== this.fire("cancel", {
                    hide: true
                }).hide) this.hide();
                a.data.preventDefault();
            }, this);
            function G() {
                var a = E._.focusList;
                a.sort(function (a, b) {
                    if (a.tabIndex != b.tabIndex) return b.tabIndex - a.tabIndex; else return a.focusIndex - b.focusIndex;
                });
                var b = a.length;
                for (var c = 0; c < b; c++) a[c].focusIndex = c;
            }
            function H(a) {
                var b = E._.focusList;
                a = a || 0;
                if (b.length < 1) return;
                var c = E._.currentFocusIndex;
                try {
                    b[c].getInputElement().$.blur();
                } catch (d) { }
                var e = (c + a + b.length) % b.length, f = e;
                while (a && !b[f].isFocusable()) {
                    f = (f + a + b.length) % b.length;
                    if (f == e) break;
                }
                b[f].focus();
                if ("text" == b[f].type) b[f].select();
            }
            this.changeFocus = H;
            function I(b) {
                var c = this;
                if (E != a.dialog._.currentTop) return;
                var d = b.data.getKeystroke(), g = "rtl" == f.lang.dir, h;
                t = u = 0;
                if (9 == d || d == 2228224 + 9) {
                    var i = d == 2228224 + 9;
                    if (E._.tabBarMode) {
                        var k = i ? j.call(E) : l.call(E);
                        E.selectPage(k);
                        E._.tabs[k][0].focus();
                    } else H(i ? -1 : 1);
                    t = 1;
                } else if (d == 4456448 + 121 && !E._.tabBarMode && E.getPageCount() > 1) {
                    E._.tabBarMode = true;
                    E._.tabs[E._.currentTabId][0].focus();
                    t = 1;
                } else if ((37 == d || 39 == d) && E._.tabBarMode) {
                    k = d == (g ? 39 : 37) ? j.call(E) : l.call(E);
                    E.selectPage(k);
                    E._.tabs[k][0].focus();
                    t = 1;
                } else if ((13 == d || 32 == d) && E._.tabBarMode) {
                    c.selectPage(c._.currentTabId);
                    c._.tabBarMode = false;
                    c._.currentFocusIndex = -1;
                    H(1);
                    t = 1;
                } else if (13 == d) {
                    var m = b.data.getTarget();
                    if (!m.is("a", "button", "select", "textarea") && (!m.is("input") || "button" != m.$.type)) {
                        h = c.getButton("ok");
                        h && e.setTimeout(h.click, 0, h);
                        t = 1;
                    }
                    u = 1;
                } else if (27 == d) {
                    h = c.getButton("cancel");
                    if (h) e.setTimeout(h.click, 0, h); else if (false !== c.fire("cancel", {
                        hide: true
                    }).hide) c.hide();
                    u = 1;
                } else return;
                J(b);
            }
            function J(a) {
                if (t) a.data.preventDefault(1); else if (u) a.data.stopPropagation();
            }
            var K = this._.element;
            this.on("show", function () {
                K.on("keydown", I, this);
                if (b.opera || b.gecko) K.on("keypress", J, this);
            });
            this.on("hide", function () {
                K.removeListener("keydown", I);
                if (b.opera || b.gecko) K.removeListener("keypress", J);
                F(function (a) {
                    o.apply(a);
                });
            });
            this.on("iframeAdded", function (a) {
                var b = new g(a.data.iframe.$.contentWindow.document);
                b.on("keydown", I, this, null, 0);
            });
            this.on("show", function () {
                var a = this;
                G();
                if (f.config.dialog_startupFocusTab && E._.pageCount > 1) {
                    E._.tabBarMode = true;
                    E._.tabs[E._.currentTabId][0].focus();
                } else if (!a._.hasFocus) {
                    a._.currentFocusIndex = -1;
                    if (i.onFocus) {
                        var b = i.onFocus.call(a);
                        b && b.focus();
                    } else H(1);
                    if ("wysiwyg" == a._.editor.mode && c) {
                        var d = f.document.$.selection, e = d.createRange();
                        if (e) if (e.parentElement && e.parentElement().ownerDocument == f.document.$ || e.item && e.item(0).ownerDocument == f.document.$) {
                            var g = document.body.createTextRange();
                            g.moveToElementText(a.getElement().getFirst().$);
                            g.collapse(true);
                            g.select();
                        }
                    }
                }
            }, this, null, 4294967295);
            if (b.ie6Compat) this.on("load", function (a) {
                var b = this.getElement(), c = b.getFirst();
                c.remove();
                c.appendTo(b);
            }, this);
            x(this);
            y(this);
            new d.text(i.title, a.document).appendTo(this.parts.title);
            for (s = 0; s < i.contents.length; s++) {
                var L = i.contents[s];
                L && this.addPage(L);
            }
            this.parts.tabs.on("click", function (a) {
                var b = this;
                var c = a.data.getTarget();
                if (c.hasClass("cke_dialog_tab")) {
                    var d = c.$.id;
                    b.selectPage(d.substring(4, d.lastIndexOf("_")));
                    if (b._.tabBarMode) {
                        b._.tabBarMode = false;
                        b._.currentFocusIndex = -1;
                        H(1);
                    }
                    a.data.preventDefault();
                }
            }, this);
            var M = [], N = a.dialog._.uiElementBuilders.hbox.build(this, {
                type: "hbox",
                className: "cke_dialog_footer_buttons",
                widths: [],
                children: i.buttons
            }, M).getChild();
            this.parts.footer.setHtml(M.join(""));
            for (s = 0; s < N.length; s++) this._.buttons[N[s].id] = N[s];
        };
        function p(a, b, c) {
            this.element = b;
            this.focusIndex = c;
            this.tabIndex = 0;
            this.isFocusable = function () {
                return !b.getAttribute("disabled") && b.isVisible();
            };
            this.focus = function () {
                a._.currentFocusIndex = this.focusIndex;
                this.element.focus();
            };
            b.on("keydown", function (a) {
                if (a.data.getKeystroke() in {
                    32: 1,
                    13: 1
                }) this.fire("click");
            });
            b.on("focus", function () {
                this.fire("mouseover");
            });
            b.on("blur", function () {
                this.fire("mouseout");
            });
        }
        function q(b) {
            var c = a.document.getWindow();
            function d() {
                b.layout();
            }
            c.on("resize", d);
            b.on("hide", function () {
                c.removeListener("resize", d);
            });
        }
        a.dialog.prototype = {
            destroy: function () {
                this.hide();
                this._.element.remove();
            },
            resize: function () {
                return function (b, c) {
                    var d = this;
                    if (d._.contentSize && d._.contentSize.width == b && d._.contentSize.height == c) return;
                    a.dialog.fire("resize", {
                        dialog: d,
                        skin: d._.editor.skinName,
                        width: b,
                        height: c
                    }, d._.editor);
                    d.fire("resize", {
                        skin: d._.editor.skinName,
                        width: b,
                        height: c
                    }, d._.editor);
                    if ("rtl" == d._.editor.lang.dir && d._.position) d._.position.x = a.document.getWindow().getViewPaneSize().width - d._.contentSize.width - parseInt(d._.element.getFirst().getStyle("right"), 10);
                    d._.contentSize = {
                        width: b,
                        height: c
                    };
                };
            }(),
            getSize: function () {
                var a = this._.element.getFirst();
                return {
                    width: a.$.offsetWidth || 0,
                    height: a.$.offsetHeight || 0
                };
            },
            move: function (b, c, d) {
                var e = this;
                var f = e._.element.getFirst(), g = "rtl" == e._.editor.lang.dir, h = "fixed" == f.getComputedStyle("position");
                if (h && e._.position && e._.position.x == b && e._.position.y == c) return;
                e._.position = {
                    x: b,
                    y: c
                };
                if (!h) {
                    var i = a.document.getWindow().getScrollPosition();
                    b += i.x;
                    c += i.y;
                }
                if (g) {
                    var j = e.getSize(), k = a.document.getWindow().getViewPaneSize();
                    b = k.width - j.width - b;
                }
                var l = {
                    top: (c > 0 ? c : 0) + "px"
                };
                l[g ? "right" : "left"] = (b > 0 ? b : 0) + "px";
                f.setStyles(l);
                d && (e._.moved = 1);
            },
            getPosition: function () {
                return e.extend({}, this._.position);
            },
            show: function () {
                var c = this._.element, d = this.definition;
                if (!(c.getParent() && c.getParent().equals(a.document.getBody()))) c.appendTo(a.document.getBody()); else c.setStyle("display", "block");
                if (b.gecko && b.version < 10900) {
                    var f = this.parts.dialog;
                    f.setStyle("position", "absolute");
                    setTimeout(function () {
                        f.setStyle("position", "fixed");
                    }, 0);
                }
                this.resize(this._.contentSize && this._.contentSize.width || d.width || d.minWidth, this._.contentSize && this._.contentSize.height || d.height || d.minHeight);
                this.reset();
                this.selectPage(this.definition.contents[0].id);
                if (null === a.dialog._.currentZIndex) a.dialog._.currentZIndex = this._.editor.config.baseFloatZIndex;
                this._.element.getFirst().setStyle("z-index", a.dialog._.currentZIndex += 10);
                if (null === a.dialog._.currentTop) {
                    a.dialog._.currentTop = this;
                    this._.parentDialog = null;
                    D(this._.editor);
                } else {
                    this._.parentDialog = a.dialog._.currentTop;
                    var g = this._.parentDialog.getElement().getFirst();
                    g.$.style.zIndex -= Math.floor(this._.editor.config.baseFloatZIndex / 2);
                    a.dialog._.currentTop = this;
                }
                c.on("keydown", H);
                c.on(b.opera ? "keypress" : "keyup", I);
                this._.hasFocus = false;
                e.setTimeout(function () {
                    this.layout();
                    q(this);
                    this.parts.dialog.setStyle("visibility", "");
                    this.fireOnce("load", {});
                    k.fire("ready", this);
                    this.fire("show", {});
                    this._.editor.fire("dialogShow", this);
                    this.foreach(function (a) {
                        a.setInitValue && a.setInitValue();
                    });
                }, 100, this);
            },
            layout: function () {
                var c = this;
                var d = c.parts.dialog, e = c.getSize(), f = a.document.getWindow(), g = f.getViewPaneSize(), h = (g.width - e.width) / 2, i = (g.height - e.height) / 2;
                if (!b.ie6Compat) if (e.height + (i > 0 ? i : 0) > g.height || e.width + (h > 0 ? h : 0) > g.width) d.setStyle("position", "absolute"); else d.setStyle("position", "fixed");
                c.move(c._.moved ? c._.position.x : h, c._.moved ? c._.position.y : i);
            },
            foreach: function (a) {
                var b = this;
                for (var c in b._.contents) for (var d in b._.contents[c]) a.call(b, b._.contents[c][d]);
                return b;
            },
            reset: function () {
                var a = function (a) {
                    if (a.reset) a.reset(1);
                };
                return function () {
                    this.foreach(a);
                    return this;
                };
            }(),
            setupContent: function () {
                var a = arguments;
                this.foreach(function (b) {
                    if (b.setup) b.setup.apply(b, a);
                });
            },
            commitContent: function () {
                var a = arguments;
                this.foreach(function (b) {
                    if (c && this._.currentFocusIndex == b.focusIndex) b.getInputElement().$.blur();
                    if (b.commit) b.commit.apply(b, a);
                });
            },
            hide: function () {
                if (!this.parts.dialog.isVisible()) return;
                this.fire("hide", {});
                this._.editor.fire("dialogHide", this);
                this.selectPage(this._.tabIdList[0]);
                var d = this._.element;
                d.setStyle("display", "none");
                this.parts.dialog.setStyle("visibility", "hidden");
                K(this);
                while (a.dialog._.currentTop != this) a.dialog._.currentTop.hide();
                if (!this._.parentDialog) E(); else {
                    var e = this._.parentDialog.getElement().getFirst();
                    e.setStyle("z-index", parseInt(e.$.style.zIndex, 10) + Math.floor(this._.editor.config.baseFloatZIndex / 2));
                }
                a.dialog._.currentTop = this._.parentDialog;
                if (!this._.parentDialog) {
                    a.dialog._.currentZIndex = null;
                    d.removeListener("keydown", H);
                    d.removeListener(b.opera ? "keypress" : "keyup", I);
                    var f = this._.editor;
                    f.focus();
                    if ("wysiwyg" == f.mode && c) {
                        var g = f.getSelection();
                        g && g.unlock(true);
                    }
                } else a.dialog._.currentZIndex -= 10;
                delete this._.parentDialog;
                this.foreach(function (a) {
                    a.resetInitValue && a.resetInitValue();
                });
            },
            addPage: function (c) {
                var d = this;
                var f = [], g = c.label ? ' title="' + e.htmlEncode(c.label) + '"' : "", i = c.elements, j = a.dialog._.uiElementBuilders.vbox.build(d, {
                    type: "vbox",
                    className: "cke_dialog_page_contents",
                    children: c.elements,
                    expand: !!c.expand,
                    padding: c.padding,
                    style: c.style || "width: 100%;height:100%"
                }, f), k = h.createFromHtml(f.join(""));
                k.setAttribute("role", "tabpanel");
                var l = b, m = "cke_" + c.id + "_" + e.getNextNumber(), n = h.createFromHtml(['<a class="cke_dialog_tab"', d._.pageCount > 0 ? " cke_last" : "cke_first", g, !!c.hidden ? ' style="display:none"' : "", ' id="', m, '"', l.gecko && l.version >= 10900 && !l.hc ? "" : ' href="javascript:void(0)"', ' tabIndex="-1"', ' hidefocus="true"', ' role="tab">', c.label, "</a>"].join(""));
                k.setAttribute("aria-labelledby", m);
                d._.tabs[c.id] = [n, k];
                d._.tabIdList.push(c.id);
                !c.hidden && d._.pageCount++;
                d._.lastTab = n;
                d.updateStyle();
                var o = d._.contents[c.id] = {}, p, q = j.getChild();
                while (p = q.shift()) {
                    o[p.id] = p;
                    if ("function" == typeof p.getChild) q.push.apply(q, p.getChild());
                }
                k.setAttribute("name", c.id);
                k.appendTo(d.parts.contents);
                n.unselectable();
                d.parts.tabs.append(n);
                if (c.accessKey) {
                    J(d, d, "CTRL+" + c.accessKey, M, L);
                    d._.accessKeyMap["CTRL+" + c.accessKey] = c.id;
                }
            },
            selectPage: function (a) {
                if (this._.currentTabId == a) return;
                if (true === this.fire("selectPage", {
                    page: a,
                    currentPage: this._.currentTabId
                })) return;
                for (var c in this._.tabs) {
                    var d = this._.tabs[c][0], f = this._.tabs[c][1];
                    if (c != a) {
                        d.removeClass("cke_dialog_tab_selected");
                        f.hide();
                    }
                    f.setAttribute("aria-hidden", c != a);
                }
                var g = this._.tabs[a];
                g[0].addClass("cke_dialog_tab_selected");
                if (b.ie6Compat || b.ie7Compat) {
                    m(g[1]);
                    g[1].show();
                    setTimeout(function () {
                        m(g[1], 1);
                    }, 0);
                } else g[1].show();
                this._.currentTabId = a;
                this._.currentTabIndex = e.indexOf(this._.tabIdList, a);
            },
            updateStyle: function () {
                this.parts.dialog[(1 === this._.pageCount ? "add" : "remove") + "Class"]("cke_single_page");
            },
            hidePage: function (a) {
                var b = this;
                var c = b._.tabs[a] && b._.tabs[a][0];
                if (!c || 1 == b._.pageCount || !c.isVisible()) return; else if (a == b._.currentTabId) b.selectPage(j.call(b));
                c.hide();
                b._.pageCount--;
                b.updateStyle();
            },
            showPage: function (a) {
                var b = this;
                var c = b._.tabs[a] && b._.tabs[a][0];
                if (!c) return;
                c.show();
                b._.pageCount++;
                b.updateStyle();
            },
            getElement: function () {
                return this._.element;
            },
            getName: function () {
                return this._.name;
            },
            getContentElement: function (a, b) {
                var c = this._.contents[a];
                return c && c[b];
            },
            getValueOf: function (a, b) {
                return this.getContentElement(a, b).getValue();
            },
            setValueOf: function (a, b, c) {
                return this.getContentElement(a, b).setValue(c);
            },
            getButton: function (a) {
                return this._.buttons[a];
            },
            click: function (a) {
                return this._.buttons[a].click();
            },
            disableButton: function (a) {
                return this._.buttons[a].disable();
            },
            enableButton: function (a) {
                return this._.buttons[a].enable();
            },
            getPageCount: function () {
                return this._.pageCount;
            },
            getParentEditor: function () {
                return this._.editor;
            },
            getSelectedElement: function () {
                return this.getParentEditor().getSelection().getSelectedElement();
            },
            addFocusable: function (a, b) {
                var c = this;
                if ("undefined" == typeof b) {
                    b = c._.focusList.length;
                    c._.focusList.push(new p(c, a, b));
                } else {
                    c._.focusList.splice(b, 0, new p(c, a, b));
                    for (var d = b + 1; d < c._.focusList.length; d++) c._.focusList[d].focusIndex++;
                }
            }
        };
        e.extend(a.dialog, {
            add: function (a, b) {
                if (!this._.dialogDefinitions[a] || "function" == typeof b) this._.dialogDefinitions[a] = b;
            },
            exists: function (a) {
                return !!this._.dialogDefinitions[a];
            },
            getCurrent: function () {
                return a.dialog._.currentTop;
            },
            okButton: function () {
                var a = function (a, b) {
                    b = b || {};
                    return e.extend({
                        id: "ok",
                        type: "button",
                        label: a.lang.common.ok,
                        "class": "cke_dialog_ui_button_ok",
                        onClick: function (a) {
                            var b = a.data.dialog;
                            if (false !== b.fire("ok", {
                                hide: true
                            }).hide) b.hide();
                        }
                    }, b, true);
                };
                a.type = "button";
                a.override = function (b) {
                    return e.extend(function (c) {
                        return a(c, b);
                    }, {
                        type: "button"
                    }, true);
                };
                return a;
            }(),
            cancelButton: function () {
                var a = function (a, b) {
                    b = b || {};
                    return e.extend({
                        id: "cancel",
                        type: "button",
                        label: a.lang.common.cancel,
                        "class": "cke_dialog_ui_button_cancel",
                        onClick: function (a) {
                            var b = a.data.dialog;
                            if (false !== b.fire("cancel", {
                                hide: true
                            }).hide) b.hide();
                        }
                    }, b, true);
                };
                a.type = "button";
                a.override = function (b) {
                    return e.extend(function (c) {
                        return a(c, b);
                    }, {
                        type: "button"
                    }, true);
                };
                return a;
            }(),
            addUIElement: function (a, b) {
                this._.uiElementBuilders[a] = b;
            }
        });
        a.dialog._ = {
            uiElementBuilders: {},
            dialogDefinitions: {},
            currentTop: null,
            currentZIndex: null
        };
        a.event.implementOn(a.dialog);
        a.event.implementOn(a.dialog.prototype, true);
        var r = {
            resizable: 3,
            minWidth: 600,
            minHeight: 400,
            buttons: [a.dialog.okButton, a.dialog.cancelButton]
        }, s = function (a, b, c) {
            for (var d = 0, e; e = a[d]; d++) {
                if (e.id == b) return e;
                if (c && e[c]) {
                    var f = s(e[c], b, c);
                    if (f) return f;
                }
            }
            return null;
        }, t = function (a, b, c, d, e) {
            if (c) {
                for (var f = 0, g; g = a[f]; f++) {
                    if (g.id == c) {
                        a.splice(f, 0, b);
                        return b;
                    }
                    if (d && g[d]) {
                        var h = t(g[d], b, c, d, true);
                        if (h) return h;
                    }
                }
                if (e) return null;
            }
            a.push(b);
            return b;
        }, u = function (a, b, c) {
            for (var d = 0, e; e = a[d]; d++) {
                if (e.id == b) return a.splice(d, 1);
                if (c && e[c]) {
                    var f = u(e[c], b, c);
                    if (f) return f;
                }
            }
            return null;
        }, v = function (a, b) {
            this.dialog = a;
            var c = b.contents;
            for (var d = 0, f; f = c[d]; d++) c[d] = f && new w(a, f);
            e.extend(this, b);
        };
        v.prototype = {
            getContents: function (a) {
                return s(this.contents, a);
            },
            getButton: function (a) {
                return s(this.buttons, a);
            },
            addContents: function (a, b) {
                return t(this.contents, a, b);
            },
            addButton: function (a, b) {
                return t(this.buttons, a, b);
            },
            removeContents: function (a) {
                u(this.contents, a);
            },
            removeButton: function (a) {
                u(this.buttons, a);
            }
        };
        function w(a, b) {
            this._ = {
                dialog: a
            };
            e.extend(this, b);
        }
        w.prototype = {
            get: function (a) {
                return s(this.elements, a, "children");
            },
            add: function (a, b) {
                return t(this.elements, a, b, "children");
            },
            remove: function (a) {
                u(this.elements, a, "children");
            }
        };
        function x(c) {
            var d = null, e = null, f = c.getElement().getFirst(), g = c.getParentEditor(), h = g.config.dialog_magnetDistance, i = g.skin.margins || [0, 0, 0, 0];
            if ("undefined" == typeof h) h = 20;
            function j(b) {
                var f = c.getSize(), j = a.document.getWindow().getViewPaneSize(), k = b.data.$.screenX, l = b.data.$.screenY, m = k - d.x, n = l - d.y, o, p;
                d = {
                    x: k,
                    y: l
                };
                e.x += m;
                e.y += n;
                if (e.x + i[3] < h) o = -i[3]; else if (e.x - i[1] > j.width - f.width - h) o = j.width - f.width + ("rtl" == g.lang.dir ? 0 : i[1]); else o = e.x;
                if (e.y + i[0] < h) p = -i[0]; else if (e.y - i[2] > j.height - f.height - h) p = j.height - f.height + i[2]; else p = e.y;
                c.move(o, p, 1);
                b.data.preventDefault();
            }
            function k(c) {
                a.document.removeListener("mousemove", j);
                a.document.removeListener("mouseup", k);
                if (b.ie6Compat) {
                    var d = B.getChild(0).getFrameDocument();
                    d.removeListener("mousemove", j);
                    d.removeListener("mouseup", k);
                }
            }
            c.parts.title.on("mousedown", function (f) {
                d = {
                    x: f.data.$.screenX,
                    y: f.data.$.screenY
                };
                a.document.on("mousemove", j);
                a.document.on("mouseup", k);
                e = c.getPosition();
                if (b.ie6Compat) {
                    var g = B.getChild(0).getFrameDocument();
                    g.on("mousemove", j);
                    g.on("mouseup", k);
                }
                f.data.preventDefault();
            }, c);
        }
        function y(d) {
            var f = d.definition, g = f.resizable;
            if (0 == g) return;
            var i = d.getParentEditor(), j, k, l, m, n, o, p = e.addFunction(function (e) {
                n = d.getSize();
                var f = d.parts.contents, g = f.$.getElementsByTagName("iframe").length;
                if (g) {
                    o = h.createFromHtml('<div class="cke_dialog_resize_cover" style="height: 100%; position: absolute; width: 100%;"></div>');
                    f.append(o);
                }
                k = n.height - d.parts.contents.getSize("height", !(b.gecko || b.opera || c && b.quirks));
                j = n.width - d.parts.contents.getSize("width", 1);
                m = {
                    x: e.screenX,
                    y: e.screenY
                };
                l = a.document.getWindow().getViewPaneSize();
                a.document.on("mousemove", q);
                a.document.on("mouseup", r);
                if (b.ie6Compat) {
                    var i = B.getChild(0).getFrameDocument();
                    i.on("mousemove", q);
                    i.on("mouseup", r);
                }
                e.preventDefault && e.preventDefault();
            });
            d.on("load", function () {
                var a = "";
                if (1 == g) a = " cke_resizer_horizontal"; else if (2 == g) a = " cke_resizer_vertical";
                var b = h.createFromHtml('<div class="cke_resizer' + a + " cke_resizer_" + i.lang.dir + '"' + ' title="' + e.htmlEncode(i.lang.resize) + '"' + ' onmousedown="CKEDITOR.tools.callFunction(' + p + ', event )"></div>');
                d.parts.footer.append(b, 1);
            });
            i.on("destroy", function () {
                e.removeFunction(p);
            });
            function q(a) {
                var b = "rtl" == i.lang.dir, c = (a.data.$.screenX - m.x) * (b ? -1 : 1), e = a.data.$.screenY - m.y, h = n.width, o = n.height, p = h + c * (d._.moved ? 1 : 2), q = o + e * (d._.moved ? 1 : 2), r = d._.element.getFirst(), s = b && r.getComputedStyle("right"), t = d.getPosition();
                if (t.y + q > l.height) q = l.height - t.y;
                if ((b ? s : t.x) + p > l.width) p = l.width - (b ? s : t.x);
                if (1 == g || 3 == g) h = Math.max(f.minWidth || 0, p - j);
                if (2 == g || 3 == g) o = Math.max(f.minHeight || 0, q - k);
                d.resize(h, o);
                if (!d._.moved) d.layout();
                a.data.preventDefault();
            }
            function r() {
                a.document.removeListener("mouseup", r);
                a.document.removeListener("mousemove", q);
                if (o) {
                    o.remove();
                    o = null;
                }
                if (b.ie6Compat) {
                    var c = B.getChild(0).getFrameDocument();
                    c.removeListener("mouseup", r);
                    c.removeListener("mousemove", q);
                }
            }
        }
        var z, A = {}, B;
        function C(a) {
            a.data.preventDefault(1);
        }
        function D(c) {
            var d = a.document.getWindow(), f = c.config, g = f.dialog_backgroundCoverColor || "white", i = f.dialog_backgroundCoverOpacity, j = f.baseFloatZIndex, k = e.genKey(g, i, j), l = A[k];
            if (!l) {
                var m = ['<div tabIndex="-1" style="position: ', b.ie6Compat ? "absolute" : "fixed", "; z-index: ", j, "; top: 0px; left: 0px; ", !b.ie6Compat ? "background-color: " + g : "", '" class="cke_dialog_background_cover">'];
                if (b.ie6Compat) {
                    var n = b.isCustomDomain(), o = "<html><body style=\\'background-color:" + g + ";\\'></body></html>";
                    m.push('<iframe hidefocus="true" frameborder="0" id="cke_dialog_background_iframe" src="javascript:');
                    m.push("void((function(){document.open();" + (n ? "document.domain='" + document.domain + "';" : "") + "document.write( '" + o + "' );" + "document.close();" + "})())");
                    m.push('" style="position:absolute;left:0;top:0;width:100%;height: 100%;progid:DXImageTransform.Microsoft.Alpha(opacity=0)"></iframe>');
                }
                m.push("</div>");
                l = h.createFromHtml(m.join(""));
                l.setOpacity(void 0 != i ? i : .5);
                l.on("keydown", C);
                l.on("keypress", C);
                l.on("keyup", C);
                l.appendTo(a.document.getBody());
                A[k] = l;
            } else l.show();
            B = l;
            var p = function () {
                var a = d.getViewPaneSize();
                l.setStyles({
                    width: a.width + "px",
                    height: a.height + "px"
                });
            }, q = function () {
                var b = d.getScrollPosition(), c = a.dialog._.currentTop;
                l.setStyles({
                    left: b.x + "px",
                    top: b.y + "px"
                });
                if (c) do {
                    var e = c.getPosition();
                    c.move(e.x, e.y);
                } while (c = c._.parentDialog);
            };
            z = p;
            d.on("resize", p);
            p();
            if (!(b.mac && b.webkit)) l.focus();
            if (b.ie6Compat) {
                var r = function () {
                    q();
                    arguments.callee.prevScrollHandler.apply(this, arguments);
                };
                d.$.setTimeout(function () {
                    r.prevScrollHandler = window.onscroll || function () { };
                    window.onscroll = r;
                }, 0);
                q();
            }
        }
        function E() {
            if (!B) return;
            var c = a.document.getWindow();
            B.hide();
            c.removeListener("resize", z);
            if (b.ie6Compat) c.$.setTimeout(function () {
                var a = window.onscroll && window.onscroll.prevScrollHandler;
                window.onscroll = a || null;
            }, 0);
            z = null;
        }
        function F() {
            for (var a in A) A[a].remove();
            A = {};
        }
        var G = {}, H = function (a) {
            var b = a.data.$.ctrlKey || a.data.$.metaKey, c = a.data.$.altKey, d = a.data.$.shiftKey, e = String.fromCharCode(a.data.$.keyCode), f = G[(b ? "CTRL+" : "") + (c ? "ALT+" : "") + (d ? "SHIFT+" : "") + e];
            if (!f || !f.length) return;
            f = f[f.length - 1];
            f.keydown && f.keydown.call(f.uiElement, f.dialog, f.key);
            a.data.preventDefault();
        }, I = function (a) {
            var b = a.data.$.ctrlKey || a.data.$.metaKey, c = a.data.$.altKey, d = a.data.$.shiftKey, e = String.fromCharCode(a.data.$.keyCode), f = G[(b ? "CTRL+" : "") + (c ? "ALT+" : "") + (d ? "SHIFT+" : "") + e];
            if (!f || !f.length) return;
            f = f[f.length - 1];
            if (f.keyup) {
                f.keyup.call(f.uiElement, f.dialog, f.key);
                a.data.preventDefault();
            }
        }, J = function (a, b, c, d, e) {
            var f = G[c] || (G[c] = []);
            f.push({
                uiElement: a,
                dialog: b,
                key: c,
                keyup: e || a.accessKeyUp,
                keydown: d || a.accessKeyDown
            });
        }, K = function (a) {
            for (var b in G) {
                var c = G[b];
                for (var d = c.length - 1; d >= 0; d--) if (c[d].dialog == a || c[d].uiElement == a) c.splice(d, 1);
                if (0 === c.length) delete G[b];
            }
        }, L = function (a, b) {
            if (a._.accessKeyMap[b]) a.selectPage(a._.accessKeyMap[b]);
        }, M = function (a, b) { };
        !function () {
            k.dialog = {
                uiElement: function (d, f, g, h, i, j, k) {
                    if (arguments.length < 4) return;
                    var l = (h.call ? h(f) : h) || "div", m = ["<", l, " "], n = (i && i.call ? i(f) : i) || {}, o = (j && j.call ? j(f) : j) || {}, p = (k && k.call ? k.call(this, d, f) : k) || "", q = this.domId = o.id || e.getNextId() + "_uiElement", r = this.id = f.id, s;
                    o.id = q;
                    var t = {};
                    if (f.type) t["cke_dialog_ui_" + f.type] = 1;
                    if (f.className) t[f.className] = 1;
                    if (f.disabled) t.cke_disabled = 1;
                    var u = o["class"] && o["class"].split ? o["class"].split(" ") : [];
                    for (s = 0; s < u.length; s++) if (u[s]) t[u[s]] = 1;
                    var v = [];
                    for (s in t) v.push(s);
                    o["class"] = v.join(" ");
                    if (f.title) o.title = f.title;
                    var w = (f.style || "").split(";");
                    if (f.align) {
                        var x = f.align;
                        n["margin-left"] = "left" == x ? 0 : "auto";
                        n["margin-right"] = "right" == x ? 0 : "auto";
                    }
                    for (s in n) w.push(s + ":" + n[s]);
                    if (f.hidden) w.push("display:none");
                    for (s = w.length - 1; s >= 0; s--) if ("" === w[s]) w.splice(s, 1);
                    if (w.length > 0) o.style = (o.style ? o.style + "; " : "") + w.join("; ");
                    for (s in o) m.push(s + '="' + e.htmlEncode(o[s]) + '" ');
                    m.push(">", p, "</", l, ">");
                    g.push(m.join(""));
                    (this._ || (this._ = {})).dialog = d;
                    if ("boolean" == typeof f.isChanged) this.isChanged = function () {
                        return f.isChanged;
                    };
                    if ("function" == typeof f.isChanged) this.isChanged = f.isChanged;
                    if ("function" == typeof f.setValue) this.setValue = e.override(this.setValue, function (a) {
                        return function (b) {
                            a.call(this, f.setValue.call(this, b));
                        };
                    });
                    if ("function" == typeof f.getValue) this.getValue = e.override(this.getValue, function (a) {
                        return function () {
                            return f.getValue.call(this, a.call(this));
                        };
                    });
                    a.event.implementOn(this);
                    this.registerEvents(f);
                    if (this.accessKeyUp && this.accessKeyDown && f.accessKey) J(this, d, "CTRL+" + f.accessKey);
                    var y = this;
                    d.on("load", function () {
                        var a = y.getInputElement();
                        if (a) {
                            var e = y.type in {
                                checkbox: 1,
                                ratio: 1
                            } && c && b.version < 8 ? "cke_dialog_ui_focused" : "";
                            a.on("focus", function () {
                                d._.tabBarMode = false;
                                d._.hasFocus = true;
                                y.fire("focus");
                                e && this.addClass(e);
                            });
                            a.on("blur", function () {
                                y.fire("blur");
                                e && this.removeClass(e);
                            });
                        }
                    });
                    if (this.keyboardFocusable) {
                        this.tabIndex = f.tabIndex || 0;
                        this.focusIndex = d._.focusList.push(this) - 1;
                        this.on("focus", function () {
                            d._.currentFocusIndex = y.focusIndex;
                        });
                    }
                    e.extend(this, f);
                },
                hbox: function (a, d, e, g, h) {
                    if (arguments.length < 4) return;
                    this._ || (this._ = {});
                    var i = this._.children = d, j = h && h.widths || null, l = h && h.height || null, m = {}, n, o = function () {
                        var a = ['<tbody><tr class="cke_dialog_ui_hbox">'];
                        for (n = 0; n < e.length; n++) {
                            var d = "cke_dialog_ui_hbox_child", g = [];
                            if (0 === n) d = "cke_dialog_ui_hbox_first";
                            if (n == e.length - 1) d = "cke_dialog_ui_hbox_last";
                            a.push('<td class="', d, '" role="presentation" ');
                            if (j) {
                                if (j[n]) g.push("width:" + f(j[n]));
                            } else g.push("width:" + Math.floor(100 / e.length) + "%");
                            if (l) g.push("height:" + f(l));
                            if (h && void 0 != h.padding) g.push("padding:" + f(h.padding));
                            if (c && b.quirks && i[n].align) g.push("text-align:" + i[n].align);
                            if (g.length > 0) a.push('style="' + g.join("; ") + '" ');
                            a.push(">", e[n], "</td>");
                        }
                        a.push("</tr></tbody>");
                        return a.join("");
                    }, p = {
                        role: "presentation"
                    };
                    h && h.align && (p.align = h.align);
                    k.dialog.uiElement.call(this, a, h || {
                        type: "hbox"
                    }, g, "table", m, p, o);
                },
                vbox: function (a, d, g, h, i) {
                    if (arguments.length < 3) return;
                    this._ || (this._ = {});
                    var j = this._.children = d, l = i && i.width || null, m = i && i.heights || null, n = function () {
                        var d = ['<table role="presentation" cellspacing="0" border="0" '];
                        d.push('style="');
                        if (i && i.expand) d.push("height:100%;");
                        d.push("width:" + f(l || "100%"), ";");
                        d.push('"');
                        d.push('align="', e.htmlEncode(i && i.align || ("ltr" == a.getParentEditor().lang.dir ? "left" : "right")), '" ');
                        d.push("><tbody>");
                        for (var h = 0; h < g.length; h++) {
                            var k = [];
                            d.push('<tr><td role="presentation" ');
                            if (l) k.push("width:" + f(l || "100%"));
                            if (m) k.push("height:" + f(m[h])); else if (i && i.expand) k.push("height:" + Math.floor(100 / g.length) + "%");
                            if (i && void 0 != i.padding) k.push("padding:" + f(i.padding));
                            if (c && b.quirks && j[h].align) k.push("text-align:" + j[h].align);
                            if (k.length > 0) d.push('style="', k.join("; "), '" ');
                            d.push(' class="cke_dialog_ui_vbox_child">', g[h], "</td></tr>");
                        }
                        d.push("</tbody></table>");
                        return d.join("");
                    };
                    k.dialog.uiElement.call(this, a, i || {
                        type: "vbox"
                    }, h, "div", null, {
                        role: "presentation"
                    }, n);
                }
            };
        }();
        k.dialog.uiElement.prototype = {
            getElement: function () {
                return a.document.getById(this.domId);
            },
            getInputElement: function () {
                return this.getElement();
            },
            getDialog: function () {
                return this._.dialog;
            },
            setValue: function (a, b) {
                this.getInputElement().setValue(a);
                !b && this.fire("change", {
                    value: a
                });
                return this;
            },
            getValue: function () {
                return this.getInputElement().getValue();
            },
            isChanged: function () {
                return false;
            },
            selectParentTab: function () {
                var a = this;
                var b = a.getInputElement(), c = b, d;
                while ((c = c.getParent()) && c.$.className.search("cke_dialog_page_contents") == -1);
                if (!c) return a;
                d = c.getAttribute("name");
                if (a._.dialog._.currentTabId != d) a._.dialog.selectPage(d);
                return a;
            },
            focus: function () {
                this.selectParentTab().getInputElement().focus();
                return this;
            },
            registerEvents: function (a) {
                var b = /^on([A-Z]\w+)/, c, d = function (a, b, c, d) {
                    b.on("load", function () {
                        a.getInputElement().on(c, d, a);
                    });
                };
                for (var e in a) {
                    if (!(c = e.match(b))) continue;
                    if (this.eventProcessors[e]) this.eventProcessors[e].call(this, this._.dialog, a[e]); else d(this, this._.dialog, c[1].toLowerCase(), a[e]);
                }
                return this;
            },
            eventProcessors: {
                onLoad: function (a, b) {
                    a.on("load", b, this);
                },
                onShow: function (a, b) {
                    a.on("show", b, this);
                },
                onHide: function (a, b) {
                    a.on("hide", b, this);
                }
            },
            accessKeyDown: function (a, b) {
                this.focus();
            },
            accessKeyUp: function (a, b) { },
            disable: function () {
                var a = this.getElement(), b = this.getInputElement();
                b.setAttribute("disabled", "true");
                a.addClass("cke_disabled");
            },
            enable: function () {
                var a = this.getElement(), b = this.getInputElement();
                b.removeAttribute("disabled");
                a.removeClass("cke_disabled");
            },
            isEnabled: function () {
                return !this.getElement().hasClass("cke_disabled");
            },
            isVisible: function () {
                return this.getInputElement().isVisible();
            },
            isFocusable: function () {
                if (!this.isEnabled() || !this.isVisible()) return false;
                return true;
            }
        };
        k.dialog.hbox.prototype = e.extend(new k.dialog.uiElement(), {
            getChild: function (a) {
                var b = this;
                if (arguments.length < 1) return b._.children.concat();
                if (!a.splice) a = [a];
                if (a.length < 2) return b._.children[a[0]]; else return b._.children[a[0]] && b._.children[a[0]].getChild ? b._.children[a[0]].getChild(a.slice(1, a.length)) : null;
            }
        }, true);
        k.dialog.vbox.prototype = new k.dialog.hbox();
        !function () {
            var b = {
                build: function (b, c, d) {
                    var e = c.children, f, g = [], h = [];
                    for (var i = 0; i < e.length && (f = e[i]); i++) {
                        var j = [];
                        g.push(j);
                        h.push(a.dialog._.uiElementBuilders[f.type].build(b, f, j));
                    }
                    return new k.dialog[c.type](b, h, g, d, c);
                }
            };
            a.dialog.addUIElement("hbox", b);
            a.dialog.addUIElement("vbox", b);
        }();
        a.dialogCommand = function (a) {
            this.dialogName = a;
        };
        a.dialogCommand.prototype = {
            exec: function (a) {
                b.opera ? e.setTimeout(function () {
                    a.openDialog(this.dialogName);
                }, 0, this) : a.openDialog(this.dialogName);
            },
            canUndo: false,
            editorFocus: c || b.webkit
        };
        !function () {
            var b = /^([a]|[^a])+$/, c = /^\d*$/, d = /^\d*(?:\.\d+)?$/, f = /^(((\d*(\.\d+))|(\d*))(px|\%)?)?$/, g = /^(((\d*(\.\d+))|(\d*))(px|em|ex|in|cm|mm|pt|pc|\%)?)?$/i, h = /^(\s*[\w-]+\s*:\s*[^:;]+(?:;|$))*$/;
            a.VALIDATE_OR = 1;
            a.VALIDATE_AND = 2;
            a.dialog.validate = {
                functions: function () {
                    var a = arguments;
                    return function () {
                        var b = this && this.getValue ? this.getValue() : a[0], c = void 0, d = 2, e = [], f;
                        for (f = 0; f < a.length; f++) if ("function" == typeof a[f]) e.push(a[f]); else break;
                        if (f < a.length && "string" == typeof a[f]) {
                            c = a[f];
                            f++;
                        }
                        if (f < a.length && "number" == typeof a[f]) d = a[f];
                        var g = 2 == d ? true : false;
                        for (f = 0; f < e.length; f++) if (2 == d) g = g && e[f](b); else g = g || e[f](b);
                        return !g ? c : true;
                    };
                },
                regex: function (a, b) {
                    return function () {
                        var c = this && this.getValue ? this.getValue() : arguments[0];
                        return !a.test(c) ? b : true;
                    };
                },
                notEmpty: function (a) {
                    return this.regex(b, a);
                },
                integer: function (a) {
                    return this.regex(c, a);
                },
                number: function (a) {
                    return this.regex(d, a);
                },
                cssLength: function (a) {
                    return this.functions(function (a) {
                        return g.test(e.trim(a));
                    }, a);
                },
                htmlLength: function (a) {
                    return this.functions(function (a) {
                        return f.test(e.trim(a));
                    }, a);
                },
                inlineStyle: function (a) {
                    return this.functions(function (a) {
                        return h.test(e.trim(a));
                    }, a);
                },
                equals: function (a, b) {
                    return this.functions(function (b) {
                        return b == a;
                    }, b);
                },
                notEqual: function (a, b) {
                    return this.functions(function (b) {
                        return b != a;
                    }, b);
                }
            };
            a.on("instanceDestroyed", function (b) {
                if (e.isEmpty(a.instances)) {
                    var c;
                    while (c = a.dialog._.currentTop) c.hide();
                    F();
                }
                var d = b.editor._.storedDialogs;
                for (var f in d) d[f].destroy();
            });
        }();
        e.extend(a.editor.prototype, {
            openDialog: function (b, d) {
                if ("wysiwyg" == this.mode && c) {
                    var e = this.getSelection();
                    e && e.lock();
                }
                var f = a.dialog._.dialogDefinitions[b], g = this.skin.dialog;
                if (null === a.dialog._.currentTop) D(this);
                if ("function" == typeof f && g._isLoaded) {
                    var h = this._.storedDialogs || (this._.storedDialogs = {}), i = h[b] || (h[b] = new a.dialog(this, b));
                    d && d.call(i, i);
                    i.show();
                    return i;
                } else if ("failed" == f) {
                    E();
                    throw new Error('[CKEDITOR.dialog.openDialog] Dialog "' + b + '" failed when loading definition.');
                }
                var j = this;
                function k(c) {
                    var e = a.dialog._.dialogDefinitions[b], f = j.skin.dialog;
                    if (!f._isLoaded || l && "undefined" == typeof c) return;
                    if ("function" != typeof e) a.dialog._.dialogDefinitions[b] = "failed";
                    j.openDialog(b, d);
                }
                if ("string" == typeof f) {
                    var l = 1;
                    a.scriptLoader.load(a.getUrl(f), k, null, 0, 1);
                }
                a.skins.load(this, "dialog", k);
                return null;
            }
        });
    }();
    j.add("dialog", {
        requires: ["dialogui"]
    });
    j.add("styles", {
        requires: ["selection"],
        init: function (a) {
            a.on("contentDom", function () {
                a.document.setCustomData("cke_includeReadonly", !a.config.disableReadonlyStyling);
            });
        }
    });
    a.editor.prototype.attachStyleStateChange = function (a, b) {
        var c = this._.styleStateChangeCallbacks;
        if (!c) {
            c = this._.styleStateChangeCallbacks = [];
            this.on("selectionChange", function (a) {
                for (var b = 0; b < c.length; b++) {
                    var d = c[b], e = d.style.checkActive(a.data.path) ? 1 : 2;
                    d.fn.call(this, e);
                }
            });
        }
        c.push({
            style: a,
            fn: b
        });
    };
    a.STYLE_BLOCK = 1;
    a.STYLE_INLINE = 2;
    a.STYLE_OBJECT = 3;
    !function () {
        var b = {
            address: 1,
            div: 1,
            h1: 1,
            h2: 1,
            h3: 1,
            h4: 1,
            h5: 1,
            h6: 1,
            p: 1,
            pre: 1,
            section: 1,
            header: 1,
            footer: 1,
            nav: 1,
            article: 1,
            aside: 1,
            figure: 1,
            dialog: 1,
            hgroup: 1,
            time: 1,
            meter: 1,
            menu: 1,
            command: 1,
            keygen: 1,
            output: 1,
            progress: 1,
            details: 1,
            datagrid: 1,
            datalist: 1
        }, g = {
            a: 1,
            embed: 1,
            hr: 1,
            img: 1,
            li: 1,
            object: 1,
            ol: 1,
            table: 1,
            td: 1,
            tr: 1,
            th: 1,
            ul: 1,
            dl: 1,
            dt: 1,
            dd: 1,
            form: 1,
            audio: 1,
            video: 1
        }, i = /\s*(?:;\s*|$)/, j = /#\((.+?)\)/g, k = d.walker.bookmark(0, 1), l = d.walker.whitespaces(1);
        a.style = function (a, c) {
            var d = this;
            var f = a.attributes;
            if (f && f.style) {
                a.styles = e.extend({}, a.styles, K(f.style));
                delete f.style;
            }
            if (c) {
                a = e.clone(a);
                F(a.attributes, c);
                F(a.styles, c);
            }
            var h = d.element = a.element ? "string" == typeof a.element ? a.element.toLowerCase() : a.element : "*";
            d.type = b[h] ? 1 : g[h] ? 3 : 2;
            if ("object" == typeof d.element) d.type = 3;
            d._ = {
                definition: a
            };
        };
        a.style.prototype = {
            apply: function (a) {
                M.call(this, a, false);
            },
            remove: function (a) {
                M.call(this, a, true);
            },
            applyToRange: function (a) {
                var b = this;
                return (b.applyToRange = 2 == b.type ? n : 1 == b.type ? r : 3 == b.type ? p : null).call(b, a);
            },
            removeFromRange: function (a) {
                var b = this;
                return (b.removeFromRange = 2 == b.type ? o : 1 == b.type ? s : 3 == b.type ? q : null).call(b, a);
            },
            applyToObject: function (a) {
                E(a, this);
            },
            checkActive: function (a) {
                var b = this;
                switch (b.type) {
                    case 1:
                        return b.checkElementRemovable(a.block || a.blockLimit, true);

                    case 3:
                    case 2:
                        var c = a.elements;
                        for (var d = 0, e; d < c.length; d++) {
                            e = c[d];
                            if (2 == b.type && (e == a.block || e == a.blockLimit)) continue;
                            if (3 == b.type) {
                                var f = e.getName();
                                if (!("string" == typeof b.element ? f == b.element : f in b.element)) continue;
                            }
                            if (b.checkElementRemovable(e, true)) return true;
                        }
                }
                return false;
            },
            checkApplicable: function (a) {
                switch (this.type) {
                    case 2:
                    case 1:
                        break;

                    case 3:
                        return a.lastElement.getAscendant(this.element, true);
                }
                return true;
            },
            checkElementMatch: function (a, b) {
                var c = this;
                var d = c._.definition;
                if (!a || !d.ignoreReadonly && a.isReadOnly()) return false;
                var e, f = a.getName();
                if ("string" == typeof c.element ? f == c.element : f in c.element) {
                    if (!b && !a.hasAttributes()) return true;
                    e = G(d);
                    if (e._length) {
                        for (var g in e) {
                            if ("_length" == g) continue;
                            var h = a.getAttribute(g) || "";
                            if ("style" == g ? L(e[g], J(h, false)) : e[g] == h) {
                                if (!b) return true;
                            } else if (b) return false;
                        }
                        if (b) return true;
                    } else return true;
                }
                return false;
            },
            checkElementRemovable: function (a, b) {
                if (this.checkElementMatch(a, b)) return true;
                var c = H(this)[a.getName()];
                if (c) {
                    var d, e;
                    if (!(d = c.attributes)) return true;
                    for (var f = 0; f < d.length; f++) {
                        e = d[f][0];
                        var g = a.getAttribute(e);
                        if (g) {
                            var h = d[f][1];
                            if (null === h || "string" == typeof h && g == h || h.test(g)) return true;
                        }
                    }
                }
                return false;
            },
            buildPreview: function (b) {
                var c = this._.definition, d = [], e = c.element;
                if ("bdo" == e) e = "span";
                d = ["<", e];
                var f = c.attributes;
                if (f) for (var g in f) d.push(" ", g, '="', f[g], '"');
                var h = a.style.getStyleText(c);
                if (h) d.push(' style="', h, '"');
                d.push(">", b || c.name, "</", e, ">");
                return d.join("");
            }
        };
        a.style.getStyleText = function (a) {
            var b = a._ST;
            if (b) return b;
            b = a.styles;
            var c = a.attributes && a.attributes.style || "", d = "";
            if (c.length) c = c.replace(i, ";");
            for (var e in b) {
                var f = b[e], g = (e + ":" + f).replace(i, ";");
                if ("inherit" == f) d += g; else c += g;
            }
            if (c.length) c = J(c);
            c += d;
            return a._ST = c;
        };
        function m(a) {
            var b, c;
            while (a = a.getParent()) {
                if ("body" == a.getName()) break;
                if (a.getAttribute("data-nostyle")) b = a; else if (!c) {
                    var d = a.getAttribute("contentEditable");
                    if ("false" == d) b = a; else if ("true" == d) c = 1;
                }
            }
            return b;
        }
        function n(a) {
            var b = this;
            var e = a.document;
            if (a.collapsed) {
                var g = D(b, e);
                a.insertNode(g);
                a.moveToPosition(g, 2);
                return;
            }
            var i = b.element, j = b._.definition, l, n = j.ignoreReadonly, o = n || j.includeReadonly;
            if (void 0 == o) o = e.getCustomData("cke_includeReadonly");
            var p = f[i] || (l = true, f.span);
            a.enlarge(1, 1);
            a.trim();
            var q = a.createBookmark(), r = q.startNode, s = q.endNode, t = r, u;
            if (!n) {
                var v = m(r), w = m(s);
                if (v) t = v.getNextSourceNode(true);
                if (w) s = w;
            }
            if (2 == t.getPosition(s)) t = 0;
            while (t) {
                var x = false;
                if (t.equals(s)) {
                    t = null;
                    x = true;
                } else {
                    var y = t.type, z = 1 == y ? t.getName() : null, B = z && "false" == t.getAttribute("contentEditable"), C = z && t.getAttribute("data-nostyle");
                    if (z && t.data("cke-bookmark")) {
                        t = t.getNextSourceNode(true);
                        continue;
                    }
                    if (!z || p[z] && !C && (!B || o) && (4 | t.getPosition(s) | 0 | 8) == 4 + 0 + 8 && (!j.childRule || j.childRule(t))) {
                        var E = t.getParent();
                        if (E && ((E.getDtd() || f.span)[i] || l) && (!j.parentRule || j.parentRule(E))) {
                            if (!u && (!z || !f.$removeEmpty[z] || (4 | t.getPosition(s) | 0 | 8) == 4 + 0 + 8)) {
                                u = new d.range(e);
                                u.setStartBefore(t);
                            }
                            if (3 == y || B || 1 == y && !t.getChildCount()) {
                                var F = t, G;
                                while ((x = !F.getNext(k)) && (G = F.getParent(), p[G.getName()]) && (2 | G.getPosition(r) | 0 | 8) == 2 + 0 + 8 && (!j.childRule || j.childRule(G))) F = G;
                                u.setEndAfter(F);
                            }
                        } else x = true;
                    } else x = true;
                    t = t.getNextSourceNode(C || B);
                }
                if (x && u && !u.collapsed) {
                    var H = D(b, e), I = H.hasAttributes(), J = u.getCommonAncestor(), K = {
                        styles: {},
                        attrs: {},
                        blockedStyles: {},
                        blockedAttrs: {}
                    }, L, M, N;
                    while (H && J) {
                        if (J.getName() == i) {
                            for (L in j.attributes) {
                                if (K.blockedAttrs[L] || !(N = J.getAttribute(M))) continue;
                                if (H.getAttribute(L) == N) K.attrs[L] = 1; else K.blockedAttrs[L] = 1;
                            }
                            for (M in j.styles) {
                                if (K.blockedStyles[M] || !(N = J.getStyle(M))) continue;
                                if (H.getStyle(M) == N) K.styles[M] = 1; else K.blockedStyles[M] = 1;
                            }
                        }
                        J = J.getParent();
                    }
                    for (L in K.attrs) H.removeAttribute(L);
                    for (M in K.styles) H.removeStyle(M);
                    if (I && !H.hasAttributes()) H = null;
                    if (H) {
                        u.extractContents().appendTo(H);
                        A(b, H);
                        u.insertNode(H);
                        H.mergeSiblings();
                        if (!c) H.$.normalize();
                    } else {
                        H = new h("span");
                        u.extractContents().appendTo(H);
                        u.insertNode(H);
                        A(b, H);
                        H.remove(true);
                    }
                    u = null;
                }
            }
            a.moveToBookmark(q);
            a.shrink(2);
        }
        function o(a) {
            a.enlarge(1, 1);
            var b = a.createBookmark(), c = b.startNode;
            if (a.collapsed) {
                var e = new d.elementPath(c.getParent()), f;
                for (var g = 0, h; g < e.elements.length && (h = e.elements[g]); g++) {
                    if (h == e.block || h == e.blockLimit) break;
                    if (this.checkElementRemovable(h)) {
                        var i;
                        if (a.collapsed && (a.checkBoundaryOfElement(h, 2) || (i = a.checkBoundaryOfElement(h, 1)))) {
                            f = h;
                            f.match = i ? "start" : "end";
                        } else {
                            h.mergeSiblings();
                            if (h.getName() == this.element) z(this, h); else B(h, H(this)[h.getName()]);
                        }
                    }
                }
                if (f) {
                    var j = c;
                    for (g = 0; true; g++) {
                        var k = e.elements[g];
                        if (k.equals(f)) break; else if (k.match) continue; else k = k.clone();
                        k.append(j);
                        j = k;
                    }
                    j["start" == f.match ? "insertBefore" : "insertAfter"](f);
                }
            } else {
                var l = b.endNode, m = this;
                function n() {
                    var a = new d.elementPath(c.getParent()), b = new d.elementPath(l.getParent()), e = null, f = null;
                    for (var g = 0; g < a.elements.length; g++) {
                        var h = a.elements[g];
                        if (h == a.block || h == a.blockLimit) break;
                        if (m.checkElementRemovable(h)) e = h;
                    }
                    for (g = 0; g < b.elements.length; g++) {
                        h = b.elements[g];
                        if (h == b.block || h == b.blockLimit) break;
                        if (m.checkElementRemovable(h)) f = h;
                    }
                    if (f) l.breakParent(f);
                    if (e) c.breakParent(e);
                }
                n();
                var o = c;
                while (!o.equals(l)) {
                    var p = o.getNextSourceNode();
                    if (1 == o.type && this.checkElementRemovable(o)) {
                        if (o.getName() == this.element) z(this, o); else B(o, H(this)[o.getName()]);
                        if (1 == p.type && p.contains(c)) {
                            n();
                            p = c.getNext();
                        }
                    }
                    o = p;
                }
            }
            a.moveToBookmark(b);
        }
        function p(a) {
            var b = a.getCommonAncestor(true, true), c = b.getAscendant(this.element, true);
            c && !c.isReadOnly() && E(c, this);
        }
        function q(a) {
            var b = a.getCommonAncestor(true, true), c = b.getAscendant(this.element, true);
            if (!c) return;
            var d = this, e = d._.definition, f = e.attributes;
            if (f) for (var g in f) c.removeAttribute(g, f[g]);
            if (e.styles) for (var h in e.styles) {
                if (!e.styles.hasOwnProperty(h)) continue;
                c.removeStyle(h);
            }
        }
        function r(a) {
            var b = a.createBookmark(true), c = a.createIterator();
            c.enforceRealBlocks = true;
            if (this._.enterMode) c.enlargeBr = 2 != this._.enterMode;
            var d, e = a.document, f;
            while (d = c.getNextParagraph()) if (!d.isReadOnly()) {
                var g = D(this, e, d);
                t(d, g);
            }
            a.moveToBookmark(b);
        }
        function s(a) {
            var b = this;
            var c = a.createBookmark(1), d = a.createIterator();
            d.enforceRealBlocks = true;
            d.enlargeBr = 2 != b._.enterMode;
            var e;
            while (e = d.getNextParagraph()) if (b.checkElementRemovable(e)) if (e.is("pre")) {
                var f = 2 == b._.enterMode ? null : a.document.createElement(1 == b._.enterMode ? "p" : "div");
                f && e.copyAttributes(f);
                t(e, f);
            } else z(b, e, 1);
            a.moveToBookmark(c);
        }
        function t(a, b) {
            var c = !b;
            if (c) {
                b = a.getDocument().createElement("div");
                a.copyAttributes(b);
            }
            var d = b && b.is("pre"), e = a.is("pre"), f = d && !e, g = !d && e;
            if (f) b = y(a, b); else if (g) b = x(c ? [a.getHtml()] : v(a), b); else a.moveChildren(b);
            b.replace(a);
            if (d) u(b); else if (c) C(b);
        }
        function u(a) {
            var b;
            if (!((b = a.getPrevious(l)) && b.is && b.is("pre"))) return;
            var d = w(b.getHtml(), /\n$/, "") + "\n\n" + w(a.getHtml(), /^\n/, "");
            if (c) a.$.outerHTML = "<pre>" + d + "</pre>"; else a.setHtml(d);
            b.remove();
        }
        function v(a) {
            var b = /(\S\s*)\n(?:\s|(<span[^>]+data-cke-bookmark.*?\/span>))*\n(?!$)/gi, c = a.getName(), d = w(a.getOuterHtml(), b, function (a, b, c) {
                return b + "</pre>" + c + "<pre>";
            }), e = [];
            d.replace(/<pre\b.*?>([\s\S]*?)<\/pre>/gi, function (a, b) {
                e.push(b);
            });
            return e;
        }
        function w(a, b, c) {
            var d = "", e = "";
            a = a.replace(/(^<span[^>]+data-cke-bookmark.*?\/span>)|(<span[^>]+data-cke-bookmark.*?\/span>$)/gi, function (a, b, c) {
                b && (d = b);
                c && (e = c);
                return "";
            });
            return d + a.replace(b, c) + e;
        }
        function x(a, b) {
            var c;
            if (a.length > 1) c = new d.documentFragment(b.getDocument());
            for (var f = 0; f < a.length; f++) {
                var g = a[f];
                g = g.replace(/(\r\n|\r)/g, "\n");
                g = w(g, /^[ \t]*\n/, "");
                g = w(g, /\n$/, "");
                g = w(g, /^[ \t]+|[ \t]+$/g, function (a, b, c) {
                    if (1 == a.length) return "&nbsp;"; else if (!b) return e.repeat("&nbsp;", a.length - 1) + " "; else return " " + e.repeat("&nbsp;", a.length - 1);
                });
                g = g.replace(/\n/g, "<br>");
                g = g.replace(/[ \t]{2,}/g, function (a) {
                    return e.repeat("&nbsp;", a.length - 1) + " ";
                });
                if (c) {
                    var h = b.clone();
                    h.setHtml(g);
                    c.append(h);
                } else b.setHtml(g);
            }
            return c || b;
        }
        function y(a, b) {
            var d = a.getBogus();
            d && d.remove();
            var e = a.getHtml();
            e = w(e, /(?:^[ \t\n\r]+)|(?:[ \t\n\r]+$)/g, "");
            e = e.replace(/[ \t\r\n]*(<br[^>]*>)[ \t\r\n]*/gi, "$1");
            e = e.replace(/([ \t\n\r]+|&nbsp;)/g, " ");
            e = e.replace(/<br\b[^>]*>/gi, "\n");
            if (c) {
                var f = a.getDocument().createElement("div");
                f.append(b);
                b.$.outerHTML = "<pre>" + e + "</pre>";
                b.copyAttributes(f.getFirst());
                b = f.getFirst().remove();
            } else b.setHtml(e);
            return b;
        }
        function z(a, c) {
            var d = a._.definition, g = d.attributes, h = d.styles, i = H(a)[c.getName()], j = e.isEmpty(g) && e.isEmpty(h);
            for (var k in g) {
                if (("class" == k || a._.definition.fullMatch) && c.getAttribute(k) != I(k, g[k])) continue;
                j = c.hasAttribute(k);
                c.removeAttribute(k);
            }
            for (var l in h) {
                if (a._.definition.fullMatch && c.getStyle(l) != I(l, h[l], true)) continue;
                j = j || !!c.getStyle(l);
                c.removeStyle(l);
            }
            B(c, i, b[c.getName()]);
            if (j) !f.$block[c.getName()] || 2 == a._.enterMode && !c.hasAttributes() ? C(c) : c.renameNode(1 == a._.enterMode ? "p" : "div");
        }
        function A(a, b) {
            var c = a._.definition, d = c.attributes, e = c.styles, f = H(a), g = b.getElementsByTag(a.element);
            for (var h = g.count(); --h >= 0;) z(a, g.getItem(h));
            for (var i in f) if (i != a.element) {
                g = b.getElementsByTag(i);
                for (h = g.count() - 1; h >= 0; h--) {
                    var j = g.getItem(h);
                    B(j, f[i]);
                }
            }
        }
        function B(a, b, c) {
            var d = b && b.attributes;
            if (d) for (var e = 0; e < d.length; e++) {
                var f = d[e][0], g;
                if (g = a.getAttribute(f)) {
                    var h = d[e][1];
                    if (null === h || h.test && h.test(g) || "string" == typeof h && g == h) a.removeAttribute(f);
                }
            }
            if (!c) C(a);
        }
        function C(a) {
            if (!a.hasAttributes()) if (f.$block[a.getName()]) {
                var b = a.getPrevious(l), c = a.getNext(l);
                if (b && (3 == b.type || !b.isBlockBoundary({
                    br: 1
                }))) a.append("br", 1);
                if (c && (3 == c.type || !c.isBlockBoundary({
                    br: 1
                }))) a.append("br");
                a.remove(true);
            } else {
                var d = a.getFirst(), e = a.getLast();
                a.remove(true);
                if (d) {
                    1 == d.type && d.mergeSiblings();
                    if (e && !d.equals(e) && 1 == e.type) e.mergeSiblings();
                }
            }
        }
        function D(a, b, c) {
            var d, e = a._.definition, f = a.element;
            if ("*" == f) f = "span";
            d = new h(f, b);
            if (c) c.copyAttributes(d);
            d = E(d, a);
            if (b.getCustomData("doc_processing_style") && d.hasAttribute("id")) d.removeAttribute("id"); else b.setCustomData("doc_processing_style", 1);
            return d;
        }
        function E(b, c) {
            var d = c._.definition, e = d.attributes, f = a.style.getStyleText(d);
            if (e) for (var g in e) b.setAttribute(g, e[g]);
            if (f) b.setAttribute("style", f);
            return b;
        }
        function F(a, b) {
            for (var c in a) a[c] = a[c].replace(j, function (a, c) {
                return b[c];
            });
        }
        function G(b) {
            var c = b._AC;
            if (c) return c;
            c = {};
            var d = 0, e = b.attributes;
            if (e) for (var f in e) {
                d++;
                c[f] = e[f];
            }
            var g = a.style.getStyleText(b);
            if (g) {
                if (!c.style) d++;
                c.style = g;
            }
            c._length = d;
            return b._AC = c;
        }
        function H(a) {
            if (a._.overrides) return a._.overrides;
            var b = a._.overrides = {}, c = a._.definition.overrides;
            if (c) {
                if (!e.isArray(c)) c = [c];
                for (var d = 0; d < c.length; d++) {
                    var f = c[d], g, h, i;
                    if ("string" == typeof f) g = f.toLowerCase(); else {
                        g = f.element ? f.element.toLowerCase() : a.element;
                        i = f.attributes;
                    }
                    h = b[g] || (b[g] = {});
                    if (i) {
                        var j = h.attributes = h.attributes || [];
                        for (var k in i) j.push([k.toLowerCase(), i[k]]);
                    }
                }
            }
            return b;
        }
        function I(a, b, c) {
            var d = new h("span");
            d[c ? "setStyle" : "setAttribute"](a, b);
            return d[c ? "getStyle" : "getAttribute"](a);
        }
        function J(a, b) {
            var c;
            if (false !== b) {
                var d = new h("span");
                d.setAttribute("style", a);
                c = d.getAttribute("style") || "";
            } else c = a;
            c = c.replace(/(font-family:)(.*?)(?=;|$)/, function (a, b, c) {
                var d = c.split(",");
                for (var f = 0; f < d.length; f++) d[f] = e.trim(d[f].replace(/["']/g, ""));
                return b + d.join(",");
            });
            return c.replace(/\s*([;:])\s*/, "$1").replace(/([^\s;])$/, "$1;").replace(/,\s+/g, ",").replace(/\"/g, "").toLowerCase();
        }
        function K(a) {
            var b = {};
            a.replace(/&quot;/g, '"').replace(/\s*([^ :;]+)\s*:\s*([^;]+)\s*(?=;|$)/g, function (a, c, d) {
                b[c] = d;
            });
            return b;
        }
        function L(a, b) {
            "string" == typeof a && (a = K(a));
            "string" == typeof b && (b = K(b));
            for (var c in a) if (!(c in b && (b[c] == a[c] || "inherit" == a[c] || "inherit" == b[c]))) return false;
            return true;
        }
        function M(a, b) {
            var c = a.getSelection(), d = c.createBookmarks(1), e = c.getRanges(), f = b ? this.removeFromRange : this.applyToRange, g, h = e.createIterator();
            while (g = h.getNextRange()) f.call(this, g);
            if (1 == d.length && d[0].collapsed) {
                c.selectRanges(e);
                a.getById(d[0].startNode).remove();
            } else c.selectBookmarks(d);
            a.removeCustomData("doc_processing_style");
        }
    }();
    a.styleCommand = function (a) {
        this.style = a;
    };
    a.styleCommand.prototype.exec = function (a) {
        var b = this;
        a.focus();
        var c = a.document;
        if (c) if (2 == b.state) b.style.apply(c); else if (1 == b.state) b.style.remove(c);
        return !!c;
    };
    a.stylesSet = new a.resourceManager("", "stylesSet");
    a.addStylesSet = e.bind(a.stylesSet.add, a.stylesSet);
    a.loadStylesSet = function (b, c, d) {
        a.stylesSet.addExternal(b, c, "");
        a.stylesSet.load(b, d);
    };
    a.editor.prototype.getStylesSet = function (b) {
        if (!this._.stylesDefinitions) {
            var c = this, d = c.config.stylesCombo_stylesSet || c.config.stylesSet || "default";
            if (d instanceof Array) {
                c._.stylesDefinitions = d;
                b(d);
                return;
            }
            var e = d.split(":"), f = e[0], g = e[1], h = j.registered.styles.path;
            a.stylesSet.addExternal(f, g ? e.slice(1).join(":") : h + "styles/" + f + ".js", "");
            a.stylesSet.load(f, function (a) {
                c._.stylesDefinitions = a[f];
                b(c._.stylesDefinitions);
            });
        } else b(this._.stylesDefinitions);
    };
    j.add("domiterator");
    !function () {
        function a(a) {
            var b = this;
            if (arguments.length < 1) return;
            b.range = a;
            b.forceBrBreak = 0;
            b.enlargeBr = 1;
            b.enforceRealBlocks = 0;
            b._ || (b._ = {});
        }
        var b = /^[\r\n\t ]+$/, f = d.walker.bookmark(false, true), g = d.walker.whitespaces(true), h = function (a) {
            return f(a) && g(a);
        };
        function i(a, b, c) {
            var d = a.getNextSourceNode(b, null, c);
            while (!f(d)) d = d.getNextSourceNode(b, null, c);
            return d;
        }
        a.prototype = {
            getNextParagraph: function (a) {
                var g = this;
                var j, k, l, m, n, o;
                if (!g._.started) {
                    k = g.range.clone();
                    k.shrink(1, true);
                    m = k.endContainer.hasAscendant("pre", true) || k.startContainer.hasAscendant("pre", true);
                    k.enlarge(g.forceBrBreak && !m || !g.enlargeBr ? 3 : 2);
                    if (!k.collapsed) {
                        var p = new d.walker(k.clone()), q = d.walker.bookmark(true, true);
                        p.evaluator = q;
                        g._.nextNode = p.next();
                        p = new d.walker(k.clone());
                        p.evaluator = q;
                        var r = p.previous();
                        g._.lastNode = r.getNextSourceNode(true);
                        if (g._.lastNode && 3 == g._.lastNode.type && !e.trim(g._.lastNode.getText()) && g._.lastNode.getParent().isBlockBoundary()) {
                            var s = new d.range(k.document);
                            s.moveToPosition(g._.lastNode, 4);
                            if (s.checkEndOfBlock()) {
                                var t = new d.elementPath(s.endContainer), u = t.block || t.blockLimit;
                                g._.lastNode = u.getNextSourceNode(true);
                            }
                        }
                        if (!g._.lastNode) {
                            g._.lastNode = g._.docEndMarker = k.document.createText("");
                            g._.lastNode.insertAfter(r);
                        }
                        k = null;
                    }
                    g._.started = 1;
                }
                var v = g._.nextNode;
                r = g._.lastNode;
                g._.nextNode = null;
                while (v) {
                    var w = 0, x = v.hasAscendant("pre"), y = 1 != v.type, z = 0;
                    if (!y) {
                        var A = v.getName();
                        if (v.isBlockBoundary(g.forceBrBreak && !x && {
                            br: 1
                        })) {
                            if ("br" == A) y = 1; else if (!k && !v.getChildCount() && "hr" != A) {
                                j = v;
                                l = v.equals(r);
                                break;
                            }
                            if (k) {
                                k.setEndAt(v, 3);
                                if ("br" != A) g._.nextNode = v;
                            }
                            w = 1;
                        } else {
                            if (v.getFirst()) {
                                if (!k) {
                                    k = new d.range(g.range.document);
                                    k.setStartAt(v, 3);
                                }
                                v = v.getFirst();
                                continue;
                            }
                            y = 1;
                        }
                    } else if (3 == v.type) if (b.test(v.getText())) y = 0;
                    if (y && !k) {
                        k = new d.range(g.range.document);
                        k.setStartAt(v, 3);
                    }
                    l = (!w || y) && v.equals(r);
                    if (k && !w) while (!v.getNext(h) && !l) {
                        var B = v.getParent();
                        if (B.isBlockBoundary(g.forceBrBreak && !x && {
                            br: 1
                        })) {
                            w = 1;
                            y = 0;
                            l = l || B.equals(r);
                            k.setEndAt(B, 2);
                            break;
                        }
                        v = B;
                        y = 1;
                        l = v.equals(r);
                        z = 1;
                    }
                    if (y) k.setEndAt(v, 4);
                    v = i(v, z, r);
                    l = !v;
                    if (l || w && k) break;
                }
                if (!j) {
                    if (!k) {
                        g._.docEndMarker && g._.docEndMarker.remove();
                        g._.nextNode = null;
                        return null;
                    }
                    var C = new d.elementPath(k.startContainer), D = C.blockLimit, E = {
                        div: 1,
                        th: 1,
                        td: 1
                    };
                    j = C.block;
                    if (!j && !g.enforceRealBlocks && E[D.getName()] && k.checkStartOfBlock() && k.checkEndOfBlock()) j = D; else if (!j || g.enforceRealBlocks && "li" == j.getName()) {
                        j = g.range.document.createElement(a || "p");
                        k.extractContents().appendTo(j);
                        j.trim();
                        k.insertNode(j);
                        n = o = true;
                    } else if ("li" != j.getName()) {
                        if (!k.checkStartOfBlock() || !k.checkEndOfBlock()) {
                            j = j.clone(false);
                            k.extractContents().appendTo(j);
                            j.trim();
                            var F = k.splitBlock();
                            n = !F.wasStartOfBlock;
                            o = !F.wasEndOfBlock;
                            k.insertNode(j);
                        }
                    } else if (!l) g._.nextNode = j.equals(r) ? null : i(k.getBoundaryNodes().endNode, 1, r);
                }
                if (n) {
                    var G = j.getPrevious();
                    if (G && 1 == G.type) if ("br" == G.getName()) G.remove(); else if (G.getLast() && "br" == G.getLast().$.nodeName.toLowerCase()) G.getLast().remove();
                }
                if (o) {
                    var H = j.getLast();
                    if (H && 1 == H.type && "br" == H.getName()) if (c || H.getPrevious(f) || H.getNext(f)) H.remove();
                }
                if (!g._.nextNode) g._.nextNode = l || j.equals(r) || !r ? null : i(j, 1, r);
                return j;
            }
        };
        d.range.prototype.createIterator = function () {
            return new a(this);
        };
    }();
    j.add("panelbutton", {
        requires: ["button"],
        onLoad: function () {
            function b(a) {
                var b = this;
                var c = b._;
                if (0 == c.state) return;
                b.createPanel(a);
                if (c.on) {
                    c.panel.hide();
                    return;
                }
                c.panel.showBlock(b._.id, b.document.getById(b._.id), 4);
            }
            k.panelButton = e.createClass({
                base: k.button,
                $: function (c) {
                    var d = this;
                    var e = c.panel;
                    delete c.panel;
                    d.base(c);
                    d.document = e && e.parent && e.parent.getDocument() || a.document;
                    e.block = {
                        attributes: e.attributes
                    };
                    d.hasArrow = true;
                    d.click = b;
                    d._ = {
                        panelDefinition: e
                    };
                },
                statics: {
                    handler: {
                        create: function (a) {
                            return new k.panelButton(a);
                        }
                    }
                },
                proto: {
                    createPanel: function (b) {
                        var c = this._;
                        if (c.panel) return;
                        var d = this._.panelDefinition || {}, e = this._.panelDefinition.block, f = d.parent || a.document.getBody(), g = this._.panel = new k.floatPanel(b, f, d), h = g.addBlock(c.id, e), i = this;
                        g.onShow = function () {
                            if (i.className) this.element.getFirst().addClass(i.className + "_panel");
                            i.setState(1);
                            c.on = 1;
                            if (i.onOpen) i.onOpen();
                        };
                        g.onHide = function (a) {
                            if (i.className) this.element.getFirst().removeClass(i.className + "_panel");
                            i.setState(i.modes && i.modes[b.mode] ? 2 : 0);
                            c.on = 0;
                            if (!a && i.onClose) i.onClose();
                        };
                        g.onEscape = function () {
                            g.hide();
                            i.document.getById(c.id).focus();
                        };
                        if (this.onBlock) this.onBlock(g, h);
                        h.onHide = function () {
                            c.on = 0;
                            i.setState(2);
                        };
                    }
                }
            });
        },
        beforeInit: function (a) {
            a.ui.addHandler("panelbutton", k.panelButton.handler);
        }
    });
    a.UI_PANELBUTTON = "panelbutton";
    j.add("floatpanel", {
        requires: ["panel"]
    });
    !function () {
        var f = {}, g = false;
        function i(a, b, c, d, g) {
            var i = e.genKey(b.getUniqueId(), c.getUniqueId(), a.skinName, a.lang.dir, a.uiColor || "", d.css || "", g || ""), j = f[i];
            if (!j) {
                j = f[i] = new k.panel(b, d);
                j.element = c.append(h.createFromHtml(j.renderHtml(a), b));
                j.element.setStyles({
                    display: "none",
                    position: "absolute"
                });
            }
            return j;
        }
        k.floatPanel = e.createClass({
            $: function (a, b, c, d) {
                c.forceIFrame = 1;
                var e = b.getDocument(), f = i(a, e, b, c, d || 0), g = f.element, h = g.getFirst().getFirst();
                g.disableContextMenu();
                this.element = g;
                this._ = {
                    editor: a,
                    panel: f,
                    parentElement: b,
                    definition: c,
                    document: e,
                    iframe: h,
                    children: [],
                    dir: a.lang.dir
                };
                a.on("mode", function () {
                    this.hide();
                }, this);
            },
            proto: {
                addBlock: function (a, b) {
                    return this._.panel.addBlock(a, b);
                },
                addListBlock: function (a, b) {
                    return this._.panel.addListBlock(a, b);
                },
                getBlock: function (a) {
                    return this._.panel.getBlock(a);
                },
                showBlock: function (f, i, j, k, l) {
                    var m = this._.panel, n = m.showBlock(f);
                    this.allowBlur(false);
                    g = 1;
                    this._.returnFocus = this._.editor.focusManager.hasFocus ? this._.editor : new h(a.document.$.activeElement);
                    var o = this.element, p = this._.iframe, q = this._.definition, r = i.getDocumentPosition(o.getDocument()), s = "rtl" == this._.dir, t = r.x + (k || 0), u = r.y + (l || 0);
                    if (s && (1 == j || 4 == j)) t += i.$.offsetWidth; else if (!s && (2 == j || 3 == j)) t += i.$.offsetWidth - 1;
                    if (3 == j || 4 == j) u += i.$.offsetHeight - 1;
                    this._.panel._.offsetParentId = i.getId();
                    o.setStyles({
                        top: u + "px",
                        left: 0,
                        display: ""
                    });
                    o.setOpacity(0);
                    o.getFirst().removeStyle("width");
                    if (!this._.blurSet) {
                        var v = c ? p : new d.window(p.$.contentWindow);
                        a.event.useCapture = true;
                        v.on("blur", function (a) {
                            var b = this;
                            if (!b.allowBlur()) return;
                            var c = a.data.getTarget();
                            if (c.getName && "iframe" != c.getName()) return;
                            if (b.visible && !b._.activeChild && !g) {
                                delete b._.returnFocus;
                                b.hide();
                            }
                        }, this);
                        v.on("focus", function () {
                            this._.focused = true;
                            this.hideChild();
                            this.allowBlur(true);
                        }, this);
                        a.event.useCapture = false;
                        this._.blurSet = 1;
                    }
                    m.onEscape = e.bind(function (a) {
                        if (this.onEscape && false === this.onEscape(a)) return false;
                    }, this);
                    e.setTimeout(function () {
                        var a = e.bind(function () {
                            var a = o.getFirst();
                            if (n.autoSize) {
                                var d = n.element.$;
                                if (b.gecko || b.opera) d = d.parentNode;
                                if (c) d = d.document.body;
                                var e = d.scrollWidth;
                                if (c && b.quirks && e > 0) e += (a.$.offsetWidth || 0) - (a.$.clientWidth || 0) + 3;
                                e += 4;
                                a.setStyle("width", e + "px");
                                n.element.addClass("cke_frameLoaded");
                                var f = n.element.$.scrollHeight;
                                if (c && b.quirks && f > 0) f += (a.$.offsetHeight || 0) - (a.$.clientHeight || 0) + 3;
                                a.setStyle("height", f + "px");
                                m._.currentBlock.element.setStyle("display", "none").removeStyle("display");
                            } else a.removeStyle("height");
                            if (s) t -= o.$.offsetWidth;
                            o.setStyle("left", t + "px");
                            var g = m.element, i = g.getWindow(), j = o.$.getBoundingClientRect(), k = i.getViewPaneSize(), l = j.width || j.right - j.left, p = j.height || j.bottom - j.top, q = s ? j.right : k.width - j.left, r = s ? k.width - j.right : j.left;
                            if (s) {
                                if (q < l) if (r > l) t += l; else if (k.width > l) t -= j.left; else t = t - j.right + k.width;
                            } else if (q < l) if (r > l) t -= l; else if (k.width > l) t = t - j.right + k.width; else t -= j.left;
                            var v = k.height - j.top, w = j.top;
                            if (v < p) if (w > p) u -= p; else if (k.height > p) u = u - j.bottom + k.height; else u -= j.top;
                            if (c) {
                                var x = new h(o.$.offsetParent), y = x;
                                if ("html" == y.getName()) y = y.getDocument().getBody();
                                if ("rtl" == y.getComputedStyle("direction")) if (b.ie8Compat) t -= 2 * o.getDocument().getDocumentElement().$.scrollLeft; else t -= x.$.scrollWidth - x.$.clientWidth;
                            }
                            var z = o.getFirst(), A;
                            if (A = z.getCustomData("activePanel")) A.onHide && A.onHide.call(this, 1);
                            z.setCustomData("activePanel", this);
                            o.setStyles({
                                top: u + "px",
                                left: t + "px"
                            });
                            o.setOpacity(1);
                        }, this);
                        m.isLoaded ? a() : m.onLoad = a;
                        e.setTimeout(function () {
                            p.$.contentWindow.focus();
                            this.allowBlur(true);
                        }, 0, this);
                    }, b.air ? 200 : 0, this);
                    this.visible = 1;
                    if (this.onShow) this.onShow.call(this);
                    g = 0;
                },
                hide: function (a) {
                    var c = this;
                    if (c.visible && (!c.onHide || true !== c.onHide.call(c))) {
                        c.hideChild();
                        b.gecko && c._.iframe.getFrameDocument().$.activeElement.blur();
                        c.element.setStyle("display", "none");
                        c.visible = 0;
                        c.element.getFirst().removeCustomData("activePanel");
                        var d = false !== a && c._.returnFocus;
                        if (d) {
                            if (b.webkit && d.type) d.getWindow().$.focus();
                            d.focus();
                        }
                    }
                },
                allowBlur: function (a) {
                    var b = this._.panel;
                    if (void 0 != a) b.allowBlur = a;
                    return b.allowBlur;
                },
                showAsChild: function (a, c, d, f, g, h) {
                    if (this._.activeChild == a && a._.panel._.offsetParentId == d.getId()) return;
                    this.hideChild();
                    a.onHide = e.bind(function () {
                        e.setTimeout(function () {
                            if (!this._.focused) this.hide();
                        }, 0, this);
                    }, this);
                    this._.activeChild = a;
                    this._.focused = false;
                    a.showBlock(c, d, f, g, h);
                    if (b.ie7Compat || b.ie8 && b.ie6Compat) setTimeout(function () {
                        a.element.getChild(0).$.style.cssText += "";
                    }, 100);
                },
                hideChild: function () {
                    var a = this._.activeChild;
                    if (a) {
                        delete a.onHide;
                        delete a._.returnFocus;
                        delete this._.activeChild;
                        a.hide();
                    }
                }
            }
        });
        a.on("instanceDestroyed", function () {
            var b = e.isEmpty(a.instances);
            for (var c in f) {
                var d = f[c];
                if (b) d.destroy(); else d.element.hide();
            }
            b && (f = {});
        });
    }();
    j.add("menu", {
        beforeInit: function (b) {
            var c = b.config.menu_groups.split(","), d = b._.menuGroups = {}, e = b._.menuItems = {};
            for (var f = 0; f < c.length; f++) d[c[f]] = f + 1;
            b.addMenuGroup = function (a, b) {
                d[a] = b || 100;
            };
            b.addMenuItem = function (b, c) {
                if (d[c.group]) e[b] = new a.menuItem(this, b, c);
            };
            b.addMenuItems = function (a) {
                for (var b in a) this.addMenuItem(b, a[b]);
            };
            b.getMenuItem = function (a) {
                return e[a];
            };
            b.removeMenuItem = function (a) {
                delete e[a];
            };
        },
        requires: ["floatpanel"]
    });
    !function () {
        a.menu = e.createClass({
            $: function (a, b) {
                var c = this;
                b = c._.definition = b || {};
                c.id = e.getNextId();
                c.editor = a;
                c.items = [];
                c._.listeners = [];
                c._.level = b.level || 1;
                var d = e.extend({}, b.panel, {
                    css: a.skin.editor.css,
                    level: c._.level - 1,
                    block: {}
                }), f = d.block.attributes = d.attributes || {};
                !f.role && (f.role = "menu");
                c._.panelDefinition = d;
            },
            _: {
                onShow: function () {
                    var a = this;
                    var b = a.editor.getSelection();
                    if (c) b && b.lock();
                    var d = b && b.getStartElement(), e = a._.listeners, f = [];
                    a.removeAll();
                    for (var g = 0; g < e.length; g++) {
                        var h = e[g](d, b);
                        if (h) for (var i in h) {
                            var j = a.editor.getMenuItem(i);
                            if (j && (!j.command || a.editor.getCommand(j.command).state)) {
                                j.state = h[i];
                                a.add(j);
                            }
                        }
                    }
                },
                onClick: function (a) {
                    this.hide(false);
                    if (a.onClick) a.onClick(); else if (a.command) this.editor.execCommand(a.command);
                },
                onEscape: function (a) {
                    var b = this.parent;
                    if (b) {
                        b._.panel.hideChild();
                        var c = b._.panel._.panel._.currentBlock, d = c._.focusIndex;
                        c._.markItem(d);
                    } else if (27 == a) this.hide();
                    return false;
                },
                onHide: function () {
                    var a = this;
                    if (c && !a.parent) {
                        var b = a.editor.getSelection();
                        b && b.unlock(true);
                    }
                    a.onHide && a.onHide();
                },
                showSubMenu: function (b) {
                    var c = this;
                    var d = c._.subMenu, f = c.items[b], g = f.getItems && f.getItems();
                    if (!g) {
                        c._.panel.hideChild();
                        return;
                    }
                    var h = c._.panel.getBlock(c.id);
                    h._.focusIndex = b;
                    if (d) d.removeAll(); else {
                        d = c._.subMenu = new a.menu(c.editor, e.extend({}, c._.definition, {
                            level: c._.level + 1
                        }, true));
                        d.parent = c;
                        d._.onClick = e.bind(c._.onClick, c);
                    }
                    for (var i in g) {
                        var j = c.editor.getMenuItem(i);
                        if (j) {
                            j.state = g[i];
                            d.add(j);
                        }
                    }
                    var k = c._.panel.getBlock(c.id).element.getDocument().getById(c.id + String(b));
                    d.show(k, 2);
                }
            },
            proto: {
                add: function (a) {
                    if (!a.order) a.order = this.items.length;
                    this.items.push(a);
                },
                removeAll: function () {
                    this.items = [];
                },
                show: function (b, f, g, h) {
                    if (!this.parent) {
                        this._.onShow();
                        if (!this.items.length) return;
                    }
                    f = f || ("rtl" == this.editor.lang.dir ? 2 : 1);
                    var i = this.items, j = this.editor, l = this._.panel, m = this._.element;
                    if (!l) {
                        l = this._.panel = new k.floatPanel(this.editor, a.document.getBody(), this._.panelDefinition, this._.level);
                        l.onEscape = e.bind(function (a) {
                            if (false === this._.onEscape(a)) return false;
                        }, this);
                        l.onHide = e.bind(function () {
                            this._.onHide && this._.onHide();
                        }, this);
                        var n = l.addBlock(this.id, this._.panelDefinition.block);
                        n.autoSize = true;
                        var o = n.keys;
                        o[40] = "next";
                        o[9] = "next";
                        o[38] = "prev";
                        o[2228224 + 9] = "prev";
                        o["rtl" == j.lang.dir ? 37 : 39] = c ? "mouseup" : "click";
                        o[32] = c ? "mouseup" : "click";
                        c && (o[13] = "mouseup");
                        m = this._.element = n.element;
                        m.addClass(j.skinClass);
                        var p = m.getDocument();
                        p.getBody().setStyle("overflow", "hidden");
                        p.getElementsByTag("html").getItem(0).setStyle("overflow", "hidden");
                        this._.itemOverFn = e.addFunction(function (a) {
                            var b = this;
                            clearTimeout(b._.showSubTimeout);
                            b._.showSubTimeout = e.setTimeout(b._.showSubMenu, j.config.menu_subMenuDelay || 400, b, [a]);
                        }, this);
                        this._.itemOutFn = e.addFunction(function (a) {
                            clearTimeout(this._.showSubTimeout);
                        }, this);
                        this._.itemClickFn = e.addFunction(function (a) {
                            var b = this;
                            var c = b.items[a];
                            if (0 == c.state) {
                                b.hide();
                                return;
                            }
                            if (c.getItems) b._.showSubMenu(a); else b._.onClick(c);
                        }, this);
                    }
                    d(i);
                    var q = j.container.getChild(1), r = q.hasClass("cke_mixed_dir_content") ? " cke_mixed_dir_content" : "", s = ['<div class="cke_menu' + r + '" role="presentation">'], t = i.length, u = t && i[0].group;
                    for (var v = 0; v < t; v++) {
                        var w = i[v];
                        if (u != w.group) {
                            s.push('<div class="cke_menuseparator" role="separator"></div>');
                            u = w.group;
                        }
                        w.render(this, v, s);
                    }
                    s.push("</div>");
                    m.setHtml(s.join(""));
                    k.fire("ready", this);
                    if (this.parent) this.parent._.panel.showAsChild(l, this.id, b, f, g, h); else l.showBlock(this.id, b, f, g, h);
                    j.fire("menuShow", [l]);
                },
                addListener: function (a) {
                    this._.listeners.push(a);
                },
                hide: function (a) {
                    var b = this;
                    b._.onHide && b._.onHide();
                    b._.panel && b._.panel.hide(a);
                }
            }
        });
        function d(a) {
            a.sort(function (a, b) {
                if (a.group < b.group) return -1; else if (a.group > b.group) return 1;
                return a.order < b.order ? -1 : a.order > b.order ? 1 : 0;
            });
        }
        a.menuItem = e.createClass({
            $: function (a, b, c) {
                var d = this;
                e.extend(d, c, {
                    order: 0,
                    className: "cke_button_" + b
                });
                d.group = a._.menuGroups[d.group];
                d.editor = a;
                d.name = b;
            },
            proto: {
                render: function (d, e, f) {
                    var g = this;
                    var h = d.id + String(e), i = "undefined" == typeof g.state ? 2 : g.state, j = " cke_" + (1 == i ? "on" : 0 == i ? "disabled" : "off"), k = g.label;
                    if (g.className) j += " " + g.className;
                    var l = g.getItems;
                    f.push('<span class="cke_menuitem' + (g.icon && g.icon.indexOf(".png") == -1 ? " cke_noalphafix" : "") + '">' + '<a id="', h, '" class="', j, '" href="javascript:void(\'', (g.label || "").replace("'", ""), '\')" title="', g.label, '" tabindex="-1"_cke_focus=1 hidefocus="true" role="menuitem"' + (l ? 'aria-haspopup="true"' : "") + (0 == i ? 'aria-disabled="true"' : "") + (1 == i ? 'aria-pressed="true"' : ""));
                    if (b.opera || b.gecko && b.mac) f.push(' onkeypress="return false;"');
                    if (b.gecko) f.push(' onblur="this.style.cssText = this.style.cssText;"');
                    var m = (g.iconOffset || 0) * -16;
                    f.push(' onmouseover="CKEDITOR.tools.callFunction(', d._.itemOverFn, ",", e, ');" onmouseout="CKEDITOR.tools.callFunction(', d._.itemOutFn, ",", e, ');" ' + (c ? 'onclick="return false;" onmouseup' : "onclick") + '="CKEDITOR.tools.callFunction(', d._.itemClickFn, ",", e, '); return false;"><span class="cke_icon_wrapper"><span class="cke_icon"' + (g.icon ? ' style="background-image:url(' + a.getUrl(g.icon) + ");background-position:0 " + m + 'px;"' : "") + "></span></span>" + '<span class="cke_label">');
                    if (l) f.push('<span class="cke_menuarrow">', "<span>&#", "rtl" == g.editor.lang.dir ? "9668" : "9658", ";</span>", "</span>");
                    f.push(k, "</span></a></span>");
                }
            }
        });
    }();
    i.menu_groups = "clipboard,form,tablecell,tablecellproperties,tablerow,tablecolumn,table,anchor,link,image,flash,checkbox,radio,textfield,hiddenfield,imagebutton,button,select,textarea,div";
    !function () {
        var c;
        j.add("editingblock", {
            init: function (d) {
                if (!d.config.editingBlock) return;
                d.on("themeSpace", function (a) {
                    if ("contents" == a.data.space) a.data.html += "<br>";
                });
                d.on("themeLoaded", function () {
                    d.fireOnce("editingBlockReady");
                });
                d.on("uiReady", function () {
                    d.setMode(d.config.startupMode);
                });
                d.on("afterSetData", function () {
                    if (!c) {
                        function a() {
                            c = true;
                            d.getMode().loadData(d.getData());
                            c = false;
                        }
                        if (d.mode) a(); else d.on("mode", function () {
                            if (d.mode) {
                                a();
                                d.removeListener("mode", arguments.callee);
                            }
                        });
                    }
                });
                d.on("beforeGetData", function () {
                    if (!c && d.mode) {
                        c = true;
                        d.setData(d.getMode().getData(), null, 1);
                        c = false;
                    }
                });
                d.on("getSnapshot", function (a) {
                    if (d.mode) a.data = d.getMode().getSnapshotData();
                });
                d.on("loadSnapshot", function (a) {
                    if (d.mode) d.getMode().loadSnapshotData(a.data);
                });
                d.on("mode", function (c) {
                    c.removeListener();
                    b.webkit && d.container.on("focus", function () {
                        d.focus();
                    });
                    if (d.config.startupFocus) d.focus();
                    setTimeout(function () {
                        d.fireOnce("instanceReady");
                        a.fire("instanceReady", null, d);
                    }, 0);
                });
                d.on("destroy", function () {
                    var a = this;
                    if (a.mode) a._.modes[a.mode].unload(a.getThemeSpace("contents"));
                });
            }
        });
        a.editor.prototype.mode = "";
        a.editor.prototype.addMode = function (a, b) {
            b.name = a;
            (this._.modes || (this._.modes = {}))[a] = b;
        };
        a.editor.prototype.setMode = function (a) {
            this.fire("beforeSetMode", {
                newMode: a
            });
            var b, c = this.getThemeSpace("contents"), d = this.checkDirty();
            if (this.mode) {
                if (a == this.mode) return;
                this._.previousMode = this.mode;
                this.fire("beforeModeUnload");
                var e = this.getMode();
                b = e.getData();
                e.unload(c);
                this.mode = "";
            }
            c.setHtml("");
            var f = this.getMode(a);
            if (!f) throw '[CKEDITOR.editor.setMode] Unknown mode "' + a + '".';
            if (!d) this.on("mode", function () {
                this.resetDirty();
                this.removeListener("mode", arguments.callee);
            });
            f.load(c, "string" != typeof b ? this.getData() : b);
        };
        a.editor.prototype.getMode = function (a) {
            return this._.modes && this._.modes[a || this.mode];
        };
        a.editor.prototype.focus = function () {
            this.forceNextSelectionCheck();
            var a = this.getMode();
            if (a) a.focus();
        };
    }();
    i.startupMode = "wysiwyg";
    i.editingBlock = true;
    !function () {
        function i() {
            var a = this;
            try {
                var b = a.getSelection();
                if (!b || !b.document.getWindow().$) return;
                var c = b.getStartElement(), e = new d.elementPath(c);
                if (!e.compare(a._.selectionPreviousPath)) {
                    a._.selectionPreviousPath = e;
                    a.fire("selectionChange", {
                        selection: b,
                        path: e,
                        element: c
                    });
                }
            } catch (f) { }
        }
        var k, l;
        function m() {
            l = true;
            if (k) return;
            n.call(this);
            k = e.setTimeout(n, 200, this);
        }
        function n() {
            k = null;
            if (l) {
                e.setTimeout(i, 0, this);
                l = false;
            }
        }
        function o(a) {
            function b(b, c) {
                if (!b || 3 == b.type) return false;
                var d = a.clone();
                return d["moveToElementEdit" + (c ? "End" : "Start")](b);
            }
            var c = a.startContainer, d = a.getPreviousNode(x, null, c), e = a.getNextNode(x, null, c);
            if (b(d) || b(e, 1)) return true;
            if (!(d || e) && !(1 == c.type && c.isBlockBoundary() && c.getBogus())) return true;
            return false;
        }
        var p = {
            modes: {
                wysiwyg: 1,
                source: 1
            },
            readOnly: c || b.webkit,
            exec: function (a) {
                switch (a.mode) {
                    case "wysiwyg":
                        a.document.$.execCommand("SelectAll", false, null);
                        a.forceNextSelectionCheck();
                        a.selectionChange();
                        break;

                    case "source":
                        var b = a.textarea.$;
                        if (c) b.createTextRange().execCommand("SelectAll"); else {
                            b.selectionStart = 0;
                            b.selectionEnd = b.value.length;
                        }
                        b.focus();
                }
            },
            canUndo: false
        };
        function q(a) {
            t(a);
            var b = a.createText("​");
            a.setCustomData("cke-fillingChar", b);
            return b;
        }
        function r(a) {
            return a && a.getCustomData("cke-fillingChar");
        }
        function s(a) {
            var b = a && r(a);
            if (b) if (b.getCustomData("ready")) t(a); else b.setCustomData("ready", 1);
        }
        function t(a) {
            var b = a && a.removeCustomData("cke-fillingChar");
            if (b) {
                var c, d = a.getSelection().getNative(), e = d && "None" != d.type && d.getRangeAt(0);
                if (b.getLength() > 1 && e && e.intersectsNode(b.$)) {
                    c = [d.anchorOffset, d.focusOffset];
                    var f = d.anchorNode == b.$ && d.anchorOffset > 0, g = d.focusNode == b.$ && d.focusOffset > 0;
                    f && c[0]--;
                    g && c[1]--;
                    u(d) && c.unshift(c.pop());
                }
                b.setText(b.getText().replace(/\u200B/g, ""));
                if (c) {
                    var h = d.getRangeAt(0);
                    h.setStart(h.startContainer, c[0]);
                    h.setEnd(h.startContainer, c[1]);
                    d.removeAllRanges();
                    d.addRange(h);
                }
            }
        }
        function u(a) {
            if (!a.isCollapsed) {
                var b = a.getRangeAt(0);
                b.setStart(a.anchorNode, a.anchorOffset);
                b.setEnd(a.focusNode, a.focusOffset);
                return b.collapsed;
            }
        }
        j.add("selection", {
            init: function (d) {
                if (b.webkit) {
                    d.on("selectionChange", function () {
                        s(d.document);
                    });
                    d.on("beforeSetMode", function () {
                        t(d.document);
                    });
                    var f, g;
                    function h() {
                        var a = d.document, b = r(a);
                        if (b) {
                            var c = a.$.defaultView.getSelection();
                            if ("Caret" == c.type && c.anchorNode == b.$) g = 1;
                            f = b.getText();
                            b.setText(f.replace(/\u200B/g, ""));
                        }
                    }
                    function j() {
                        var a = d.document, b = r(a);
                        if (b) {
                            b.setText(f);
                            if (g) {
                                a.$.defaultView.getSelection().setPosition(b.$, b.getLength());
                                g = 0;
                            }
                        }
                    }
                    d.on("beforeUndoImage", h);
                    d.on("afterUndoImage", j);
                    d.on("beforeGetData", h, null, null, 0);
                    d.on("getData", j);
                }
                d.on("contentDom", function () {
                    var f = d.document, g = a.document, h = f.getBody(), i = f.getDocumentElement();
                    if (c) {
                        var j, k, l = 1;
                        h.on("focusin", function (a) {
                            if ("BODY" != a.data.$.srcElement.nodeName) return;
                            var b = f.getCustomData("cke_locked_selection");
                            if (b) {
                                b.unlock(1);
                                b.lock();
                            } else if (j && l) {
                                try {
                                    j.select();
                                } catch (c) { }
                                j = null;
                            }
                        });
                        h.on("focus", function () {
                            k = 1;
                            s();
                        });
                        h.on("beforedeactivate", function (a) {
                            if (a.data.$.toElement) return;
                            k = 0;
                            l = 1;
                        });
                        c && d.on("blur", function () {
                            try {
                                f.$.selection.empty();
                            } catch (a) { }
                        });
                        i.on("mousedown", function () {
                            l = 0;
                        });
                        i.on("mouseup", function () {
                            l = 1;
                        });
                        var n;
                        h.on("mousedown", function (a) {
                            if (2 == a.data.$.button) {
                                var b = d.document.$.selection;
                                if ("None" == b.type) n = d.window.getScrollPosition();
                            }
                            r();
                        });
                        h.on("mouseup", function (a) {
                            if (2 == a.data.$.button && n) {
                                d.document.$.documentElement.scrollLeft = n.x;
                                d.document.$.documentElement.scrollTop = n.y;
                            }
                            n = null;
                            k = 1;
                            setTimeout(function () {
                                s(true);
                            }, 0);
                        });
                        h.on("keydown", r);
                        h.on("keyup", function () {
                            k = 1;
                            s();
                        });
                        if ("BackCompat" != f.$.compatMode) {
                            if (b.ie7Compat || b.ie6Compat) {
                                function o(a, b, c) {
                                    try {
                                        a.moveToPoint(b, c);
                                    } catch (d) { }
                                }
                                i.on("mousedown", function (a) {
                                    function b(a) {
                                        a = a.data.$;
                                        if (e) {
                                            var b = h.$.createTextRange();
                                            o(b, a.x, a.y);
                                            e.setEndPoint(f.compareEndPoints("StartToStart", b) < 0 ? "EndToEnd" : "StartToStart", b);
                                            e.select();
                                        }
                                    }
                                    function c() {
                                        g.removeListener("mouseup", d);
                                        i.removeListener("mouseup", d);
                                    }
                                    function d() {
                                        i.removeListener("mousemove", b);
                                        c();
                                        e.select();
                                    }
                                    a = a.data;
                                    if (a.getTarget().is("html") && a.$.x < i.$.clientWidth && a.$.y < i.$.clientHeight) {
                                        var e = h.$.createTextRange();
                                        o(e, a.$.x, a.$.y);
                                        var f = e.duplicate();
                                        i.on("mousemove", b);
                                        g.on("mouseup", d);
                                        i.on("mouseup", d);
                                    }
                                });
                            }
                            if (b.ie8) {
                                i.on("mousedown", function (a) {
                                    if (a.data.getTarget().is("html")) {
                                        g.on("mouseup", q);
                                        i.on("mouseup", q);
                                    }
                                });
                                function p() {
                                    g.removeListener("mouseup", q);
                                    i.removeListener("mouseup", q);
                                }
                                function q() {
                                    p();
                                    var b = a.document.$.selection, c = b.createRange();
                                    if ("None" != b.type && c.parentElement().ownerDocument == f.$) c.select();
                                }
                            }
                        }
                        f.on("selectionchange", s);
                        function r() {
                            k = 0;
                        }
                        function s(a) {
                            if (k) {
                                var b = d.document, c = d.getSelection(), f = c && c.getNative();
                                if (a && f && "None" == f.type) if (!b.$.queryCommandEnabled("InsertImage")) {
                                    e.setTimeout(s, 50, this, true);
                                    return;
                                }
                                var g;
                                if (f && f.type && "Control" != f.type && (g = f.createRange()) && (g = g.parentElement()) && (g = g.nodeName) && g.toLowerCase() in {
                                    input: 1,
                                    textarea: 1
                                }) return;
                                try {
                                    j = f && c.getRanges()[0];
                                } catch (h) { }
                                m.call(d);
                            }
                        }
                    } else {
                        f.on("mouseup", m, d);
                        f.on("keyup", m, d);
                        f.on("selectionchange", m, d);
                    }
                    if (b.webkit) f.on("keydown", function (a) {
                        var b = a.data.getKey();
                        switch (b) {
                            case 13:
                            case 33:
                            case 34:
                            case 35:
                            case 36:
                            case 37:
                            case 39:
                            case 8:
                            case 45:
                            case 46:
                                t(d.document);
                        }
                    }, null, null, -1);
                });
                d.on("contentDomUnload", d.forceNextSelectionCheck, d);
                d.addCommand("selectAll", p);
                d.ui.addButton("SelectAll", {
                    label: d.lang.selectAll,
                    command: "selectAll"
                });
                d.selectionChange = function (a) {
                    (a ? i : m).call(this);
                };
                b.ie9Compat && d.on("destroy", function () {
                    var a = d.getSelection();
                    a && a.getNative().clear();
                }, null, null, 9);
            }
        });
        a.editor.prototype.getSelection = function () {
            return this.document && this.document.getSelection();
        };
        a.editor.prototype.forceNextSelectionCheck = function () {
            delete this._.selectionPreviousPath;
        };
        g.prototype.getSelection = function () {
            var a = new d.selection(this);
            return !a || a.isInvalid ? null : a;
        };
        a.SELECTION_NONE = 1;
        a.SELECTION_TEXT = 2;
        a.SELECTION_ELEMENT = 3;
        d.selection = function (a) {
            var b = this;
            var d = a.getCustomData("cke_locked_selection");
            if (d) return d;
            b.document = a;
            b.isLocked = 0;
            b._ = {
                cache: {}
            };
            if (c) try {
                var e = b.getNative().createRange();
                if (!e || e.item && e.item(0).ownerDocument != b.document.$ || e.parentElement && e.parentElement().ownerDocument != b.document.$) throw 0;
            } catch (f) {
                b.isInvalid = true;
            }
            return b;
        };
        var v = {
            img: 1,
            hr: 1,
            li: 1,
            table: 1,
            tr: 1,
            td: 1,
            th: 1,
            embed: 1,
            object: 1,
            ol: 1,
            ul: 1,
            a: 1,
            input: 1,
            form: 1,
            select: 1,
            textarea: 1,
            button: 1,
            fieldset: 1,
            thead: 1,
            tfoot: 1
        };
        d.selection.prototype = {
            getNative: c ? function () {
                return this._.cache.nativeSel || (this._.cache.nativeSel = this.document.$.selection);
            } : function () {
                return this._.cache.nativeSel || (this._.cache.nativeSel = this.document.getWindow().$.getSelection());
            },
            getType: c ? function () {
                var a = this._.cache;
                if (a.type) return a.type;
                var b = 1;
                try {
                    var c = this.getNative(), d = c.type;
                    if ("Text" == d) b = 2;
                    if ("Control" == d) b = 3;
                    if (c.createRange().parentElement) b = 2;
                } catch (e) { }
                return a.type = b;
            } : function () {
                var a = this._.cache;
                if (a.type) return a.type;
                var b = 2, c = this.getNative();
                if (!c) b = 1; else if (1 == c.rangeCount) {
                    var d = c.getRangeAt(0), e = d.startContainer;
                    if (e == d.endContainer && 1 == e.nodeType && d.endOffset - d.startOffset == 1 && v[e.childNodes[d.startOffset].nodeName.toLowerCase()]) b = 3;
                }
                return a.type = b;
            },
            getRanges: function () {
                var a = c ? function () {
                    function a(a) {
                        return new d.node(a).getIndex();
                    }
                    var c = function (c, d) {
                        c = c.duplicate();
                        c.collapse(d);
                        var e = c.parentElement(), f = e.ownerDocument;
                        if (!e.hasChildNodes()) return {
                            container: e,
                            offset: 0
                        };
                        var g = e.children, h, i, j = c.duplicate(), k = 0, l = g.length - 1, m = -1, n, o, p;
                        while (k <= l) {
                            m = Math.floor((k + l) / 2);
                            h = g[m];
                            j.moveToElementText(h);
                            n = j.compareEndPoints("StartToStart", c);
                            if (n > 0) l = m - 1; else if (n < 0) k = m + 1; else if (b.ie9Compat && "BR" == h.tagName) {
                                var q = f.defaultView.getSelection();
                                return {
                                    container: q[d ? "anchorNode" : "focusNode"],
                                    offset: q[d ? "anchorOffset" : "focusOffset"]
                                };
                            } else return {
                                container: e,
                                offset: a(h)
                            };
                        }
                        if (m == -1 || m == g.length - 1 && n < 0) {
                            j.moveToElementText(e);
                            j.setEndPoint("StartToStart", c);
                            o = j.text.replace(/(\r\n|\r)/g, "\n").length;
                            g = e.childNodes;
                            if (!o) {
                                h = g[g.length - 1];
                                if (3 != h.nodeType) return {
                                    container: e,
                                    offset: g.length
                                }; else return {
                                    container: h,
                                    offset: h.nodeValue.length
                                };
                            }
                            var r = g.length;
                            while (o > 0 && r > 0) {
                                i = g[--r];
                                if (3 == i.nodeType) {
                                    p = i;
                                    o -= i.nodeValue.length;
                                }
                            }
                            return {
                                container: p,
                                offset: -o
                            };
                        } else {
                            j.collapse(n > 0 ? true : false);
                            j.setEndPoint(n > 0 ? "StartToStart" : "EndToStart", c);
                            o = j.text.replace(/(\r\n|\r)/g, "\n").length;
                            if (!o) return {
                                container: e,
                                offset: a(h) + (n > 0 ? 0 : 1)
                            };
                            while (o > 0) try {
                                i = h[n > 0 ? "previousSibling" : "nextSibling"];
                                if (3 == i.nodeType) {
                                    o -= i.nodeValue.length;
                                    p = i;
                                }
                                h = i;
                            } catch (s) {
                                return {
                                    container: e,
                                    offset: a(h)
                                };
                            }
                            return {
                                container: p,
                                offset: n > 0 ? -o : p.nodeValue.length + o
                            };
                        }
                    };
                    return function () {
                        var a = this;
                        var b = a.getNative(), e = b && b.createRange(), f = a.getType(), g;
                        if (!b) return [];
                        if (2 == f) {
                            g = new d.range(a.document);
                            var h = c(e, true);
                            g.setStart(new d.node(h.container), h.offset);
                            h = c(e);
                            g.setEnd(new d.node(h.container), h.offset);
                            if (4 & g.endContainer.getPosition(g.startContainer) && g.endOffset <= g.startContainer.getIndex()) g.collapse();
                            return [g];
                        } else if (3 == f) {
                            var i = [];
                            for (var j = 0; j < e.length; j++) {
                                var k = e.item(j), l = k.parentNode, m = 0;
                                g = new d.range(a.document);
                                for (; m < l.childNodes.length && l.childNodes[m] != k; m++);
                                g.setStart(new d.node(l), m);
                                g.setEnd(new d.node(l), m + 1);
                                i.push(g);
                            }
                            return i;
                        }
                        return [];
                    };
                }() : function () {
                    var a = [], b, c = this.document, e = this.getNative();
                    if (!e) return a;
                    if (!e.rangeCount) {
                        b = new d.range(c);
                        b.moveToElementEditStart(c.getBody());
                        a.push(b);
                    }
                    for (var f = 0; f < e.rangeCount; f++) {
                        var g = e.getRangeAt(f);
                        b = new d.range(c);
                        b.setStart(new d.node(g.startContainer), g.startOffset);
                        b.setEnd(new d.node(g.endContainer), g.endOffset);
                        a.push(b);
                    }
                    return a;
                };
                return function (b) {
                    var c = this._.cache;
                    if (c.ranges && !b) return c.ranges; else if (!c.ranges) c.ranges = new d.rangeList(a.call(this));
                    if (b) {
                        var e = c.ranges;
                        for (var f = 0; f < e.length; f++) {
                            var g = e[f], h = g.getCommonAncestor();
                            if (h.isReadOnly()) e.splice(f, 1);
                            if (g.collapsed) continue;
                            if (g.startContainer.isReadOnly()) {
                                var i = g.startContainer;
                                while (i) {
                                    if (i.is("body") || !i.isReadOnly()) break;
                                    if (1 == i.type && "false" == i.getAttribute("contentEditable")) g.setStartAfter(i);
                                    i = i.getParent();
                                }
                            }
                            var j = g.startContainer, k = g.endContainer, l = g.startOffset, m = g.endOffset, n = g.clone();
                            if (j && 3 == j.type) if (l >= j.getLength()) n.setStartAfter(j); else n.setStartBefore(j);
                            if (k && 3 == k.type) if (!m) n.setEndBefore(k); else n.setEndAfter(k);
                            var o = new d.walker(n);
                            o.evaluator = function (a) {
                                if (1 == a.type && a.isReadOnly()) {
                                    var b = g.clone();
                                    g.setEndBefore(a);
                                    if (g.collapsed) e.splice(f--, 1);
                                    if (!(16 & a.getPosition(n.endContainer))) {
                                        b.setStartAfter(a);
                                        if (!b.collapsed) e.splice(f + 1, 0, b);
                                    }
                                    return true;
                                }
                                return false;
                            };
                            o.next();
                        }
                    }
                    return c.ranges;
                };
            }(),
            getStartElement: function () {
                var a = this;
                var b = a._.cache;
                if (void 0 !== b.startElement) return b.startElement;
                var c, d = a.getNative();
                switch (a.getType()) {
                    case 3:
                        return a.getSelectedElement();

                    case 2:
                        var e = a.getRanges()[0];
                        if (e) {
                            if (!e.collapsed) {
                                e.optimize();
                                while (1) {
                                    var f = e.startContainer, g = e.startOffset;
                                    if (g == (f.getChildCount ? f.getChildCount() : f.getLength()) && !f.isBlockBoundary()) e.setStartAfter(f); else break;
                                }
                                c = e.startContainer;
                                if (1 != c.type) return c.getParent();
                                c = c.getChild(e.startOffset);
                                if (!c || 1 != c.type) c = e.startContainer; else {
                                    var i = c.getFirst();
                                    while (i && 1 == i.type) {
                                        c = i;
                                        i = i.getFirst();
                                    }
                                }
                            } else {
                                c = e.startContainer;
                                if (1 != c.type) c = c.getParent();
                            }
                            c = c.$;
                        }
                }
                return b.startElement = c ? new h(c) : null;
            },
            getSelectedElement: function () {
                var a = this._.cache;
                if (void 0 !== a.selectedElement) return a.selectedElement;
                var b = this, c = e.tryThese(function () {
                    return b.getNative().createRange().item(0);
                }, function () {
                    var a, c, g = b.getRanges()[0], h = g.getCommonAncestor(1, 1), i = {
                        table: 1,
                        ul: 1,
                        ol: 1,
                        dl: 1
                    };
                    for (var j in i) if (a = h.getAscendant(j, 1)) break;
                    if (a) {
                        var k = new d.range(this.document);
                        k.setStartAt(a, 1);
                        k.setEnd(g.startContainer, g.startOffset);
                        var l = e.extend(i, f.$listItem, f.$tableContent), m = new d.walker(k), n = function (a, b) {
                            return function (c, d) {
                                if (3 == c.type && (!e.trim(c.getText()) || c.getParent().data("cke-bookmark"))) return true;
                                var g;
                                if (1 == c.type) {
                                    g = c.getName();
                                    if ("br" == g && b && c.equals(c.getParent().getBogus())) return true;
                                    if (d && g in l || g in f.$removeEmpty) return true;
                                }
                                a.halted = 1;
                                return false;
                            };
                        };
                        m.guard = n(m);
                        if (m.checkBackward() && !m.halted) {
                            m = new d.walker(k);
                            k.setStart(g.endContainer, g.endOffset);
                            k.setEndAt(a, 2);
                            m.guard = n(m, 1);
                            if (m.checkForward() && !m.halted) c = a.$;
                        }
                    }
                    if (!c) throw 0;
                    return c;
                }, function () {
                    var a = b.getRanges()[0], c, d;
                    for (var e = 2; e && !((c = a.getEnclosedNode()) && 1 == c.type && v[c.getName()] && (d = c)); e--) a.shrink(1);
                    return d.$;
                });
                return a.selectedElement = c ? new h(c) : null;
            },
            getSelectedText: function () {
                var a = this._.cache;
                if (void 0 !== a.selectedText) return a.selectedText;
                var b = "", d = this.getNative();
                if (2 == this.getType()) b = c ? d.createRange().text : d.toString();
                return a.selectedText = b;
            },
            lock: function () {
                var a = this;
                a.getRanges();
                a.getStartElement();
                a.getSelectedElement();
                a.getSelectedText();
                a._.cache.nativeSel = {};
                a.isLocked = 1;
                a.document.setCustomData("cke_locked_selection", a);
            },
            unlock: function (a) {
                var b = this;
                var c = b.document, d = c.getCustomData("cke_locked_selection");
                if (d) {
                    c.setCustomData("cke_locked_selection", null);
                    if (a) {
                        var e = d.getSelectedElement(), f = !e && d.getRanges();
                        b.isLocked = 0;
                        b.reset();
                        if (e) b.selectElement(e); else b.selectRanges(f);
                    }
                }
                if (!d || !a) {
                    b.isLocked = 0;
                    b.reset();
                }
            },
            reset: function () {
                this._.cache = {};
            },
            selectElement: function (a) {
                var b = this;
                if (b.isLocked) {
                    var c = new d.range(b.document);
                    c.setStartBefore(a);
                    c.setEndAfter(a);
                    b._.cache.selectedElement = a;
                    b._.cache.startElement = a;
                    b._.cache.ranges = new d.rangeList(c);
                    b._.cache.type = 3;
                    return;
                }
                c = new d.range(a.getDocument());
                c.setStartBefore(a);
                c.setEndAfter(a);
                c.select();
                b.document.fire("selectionchange");
                b.reset();
            },
            selectRanges: function (a) {
                var e = this;
                if (e.isLocked) {
                    e._.cache.selectedElement = null;
                    e._.cache.startElement = a[0] && a[0].getTouchedStartNode();
                    e._.cache.ranges = new d.rangeList(a);
                    e._.cache.type = 2;
                    return;
                }
                if (c) {
                    if (a.length > 1) {
                        var f = a[a.length - 1];
                        a[0].setEnd(f.endContainer, f.endOffset);
                        a.length = 1;
                    }
                    if (a[0]) a[0].select();
                    e.reset();
                } else {
                    var g = e.getNative();
                    if (!g) return;
                    if (a.length) {
                        g.removeAllRanges();
                        b.webkit && t(e.document);
                    }
                    for (var h = 0; h < a.length; h++) {
                        if (h < a.length - 1) {
                            var i = a[h], j = a[h + 1], k = i.clone();
                            k.setStart(i.endContainer, i.endOffset);
                            k.setEnd(j.startContainer, j.startOffset);
                            if (!k.collapsed) {
                                k.shrink(1, true);
                                var l = k.getCommonAncestor(), m = k.getEnclosedNode();
                                if (l.isReadOnly() || m && m.isReadOnly()) {
                                    j.setStart(i.startContainer, i.startOffset);
                                    a.splice(h--, 1);
                                    continue;
                                }
                            }
                        }
                        var n = a[h], p = e.document.$.createRange(), r = n.startContainer;
                        if (n.collapsed && (b.opera || b.gecko && b.version < 10900) && 1 == r.type && !r.getChildCount()) r.appendText("");
                        if (n.collapsed && b.webkit && o(n)) {
                            var s = q(e.document);
                            n.insertNode(s);
                            var u = s.getNext();
                            if (u && !s.getPrevious() && 1 == u.type && "br" == u.getName()) {
                                t(e.document);
                                n.moveToPosition(u, 3);
                            } else n.moveToPosition(s, 4);
                        }
                        p.setStart(n.startContainer.$, n.startOffset);
                        try {
                            p.setEnd(n.endContainer.$, n.endOffset);
                        } catch (v) {
                            if (v.toString().indexOf("NS_ERROR_ILLEGAL_VALUE") >= 0) {
                                n.collapse(1);
                                p.setEnd(n.endContainer.$, n.endOffset);
                            } else throw v;
                        }
                        g.addRange(p);
                    }
                    e.document.fire("selectionchange");
                    e.reset();
                }
            },
            createBookmarks: function (a) {
                return this.getRanges().createBookmarks(a);
            },
            createBookmarks2: function (a) {
                return this.getRanges().createBookmarks2(a);
            },
            selectBookmarks: function (a) {
                var b = [];
                for (var c = 0; c < a.length; c++) {
                    var e = new d.range(this.document);
                    e.moveToBookmark(a[c]);
                    b.push(e);
                }
                this.selectRanges(b);
                return this;
            },
            getCommonAncestor: function () {
                var a = this.getRanges(), b = a[0].startContainer, c = a[a.length - 1].endContainer;
                return b.getCommonAncestor(c);
            },
            scrollIntoView: function () {
                var a = this.getStartElement();
                a.scrollIntoView();
            }
        };
        var w = d.walker.whitespaces(true), x = d.walker.invisible(1), y = /\ufeff|\u00a0/, z = {
            table: 1,
            tbody: 1,
            tr: 1
        };
        d.range.prototype.select = c ? function (a) {
            var b = this;
            var c = b.collapsed, d, e, f, g = b.getEnclosedNode();
            if (g) try {
                f = b.document.$.body.createControlRange();
                f.addElement(g.$);
                f.select();
                return;
            } catch (h) { }
            if (1 == b.startContainer.type && b.startContainer.getName() in z || 1 == b.endContainer.type && b.endContainer.getName() in z) b.shrink(1, true);
            var i = b.createBookmark(), j = i.startNode, k;
            if (!c) k = i.endNode;
            f = b.document.$.body.createTextRange();
            f.moveToElementText(j.$);
            f.moveStart("character", 1);
            if (k) {
                var l = b.document.$.body.createTextRange();
                l.moveToElementText(k.$);
                f.setEndPoint("EndToEnd", l);
                f.moveEnd("character", -1);
            } else {
                var m = j.getNext(w);
                d = !(m && m.getText && m.getText().match(y)) && (a || !j.hasPrevious() || j.getPrevious().is && j.getPrevious().is("br"));
                e = b.document.createElement("span");
                e.setHtml("&#65279;");
                e.insertBefore(j);
                if (d) b.document.createText("﻿").insertBefore(j);
            }
            b.setStartBefore(j);
            j.remove();
            if (c) {
                if (d) {
                    f.moveStart("character", -1);
                    f.select();
                    b.document.$.selection.clear();
                } else f.select();
                b.moveToPosition(e, 3);
                e.remove();
            } else {
                b.setEndBefore(k);
                k.remove();
                f.select();
            }
            b.document.fire("selectionchange");
        } : function () {
            this.document.getSelection().selectRanges([this]);
        };
    }();
    !function () {
        var c = a.htmlParser.cssStyle, d = e.cssLength, f = /^((?:\d*(?:\.\d+))|(?:\d+))(.*)?$/i;
        function g(a, b) {
            var c = f.exec(a), d = f.exec(b);
            if (c) {
                if (!c[2] && "px" == d[2]) return d[1];
                if ("px" == c[2] && !d[2]) return d[1] + "px";
            }
            return b;
        }
        var i = {
            elements: {
                $: function (b) {
                    var d = b.attributes, e = d && d["data-cke-realelement"], f = e && new a.htmlParser.fragment.fromHtml(decodeURIComponent(e)), h = f && f.children[0];
                    if (h && b.attributes["data-cke-resizable"]) {
                        var i = new c(b).rules, j = h.attributes, k = i.width, l = i.height;
                        k && (j.width = g(j.width, k));
                        l && (j.height = g(j.height, l));
                    }
                    return h;
                }
            }
        };
        j.add("fakeobjects", {
            requires: ["htmlwriter"],
            afterInit: function (a) {
                var b = a.dataProcessor, c = b && b.htmlFilter;
                if (c) c.addRules(i);
            }
        });
        a.editor.prototype.createFakeElement = function (e, f, g, h) {
            var i = this.lang.fakeobjects, j = i[g] || i.unknown, k = {
                "class": f,
                "data-cke-realelement": encodeURIComponent(e.getOuterHtml()),
                "data-cke-real-node-type": e.type,
                alt: j,
                title: j,
                align: e.getAttribute("align") || ""
            };
            if (!b.hc) k.src = a.getUrl("images/spacer.gif");
            if (g) k["data-cke-real-element-type"] = g;
            if (h) {
                k["data-cke-resizable"] = h;
                var l = new c(), m = e.getAttribute("width"), n = e.getAttribute("height");
                m && (l.rules.width = d(m));
                n && (l.rules.height = d(n));
                l.populate(k);
            }
            return this.document.createElement("img", {
                attributes: k
            });
        };
        a.editor.prototype.createFakeParserElement = function (e, f, g, h) {
            var i = this.lang.fakeobjects, j = i[g] || i.unknown, k, l = new a.htmlParser.basicWriter();
            e.writeHtml(l);
            k = l.getHtml();
            var m = {
                "class": f,
                "data-cke-realelement": encodeURIComponent(k),
                "data-cke-real-node-type": e.type,
                alt: j,
                title: j,
                align: e.attributes.align || ""
            };
            if (!b.hc) m.src = a.getUrl("images/spacer.gif");
            if (g) m["data-cke-real-element-type"] = g;
            if (h) {
                m["data-cke-resizable"] = h;
                var n = e.attributes, o = new c(), p = n.width, q = n.height;
                void 0 != p && (o.rules.width = d(p));
                void 0 != q && (o.rules.height = d(q));
                o.populate(m);
            }
            return new a.htmlParser.element("img", m);
        };
        a.editor.prototype.restoreRealElement = function (a) {
            if (1 != a.data("cke-real-node-type")) return null;
            var b = h.createFromHtml(decodeURIComponent(a.data("cke-realelement")), this.document);
            if (a.data("cke-resizable")) {
                var c = a.getStyle("width"), d = a.getStyle("height");
                c && b.setAttribute("width", g(b.getAttribute("width"), c));
                d && b.setAttribute("height", g(b.getAttribute("height"), d));
            }
            return b;
        };
    }();
    j.add("richcombo", {
        requires: ["floatpanel", "listblock", "button"],
        beforeInit: function (a) {
            a.ui.addHandler("richcombo", k.richCombo.handler);
        }
    });
    a.UI_RICHCOMBO = "richcombo";
    k.richCombo = e.createClass({
        $: function (b) {
            var c = this;
            e.extend(c, b, {
                title: b.label,
                modes: {
                    wysiwyg: 1
                }
            });
            var d = c.panel || {};
            delete c.panel;
            c.id = e.getNextNumber();
            c.document = d && d.parent && d.parent.getDocument() || a.document;
            d.className = (d.className || "") + " cke_rcombopanel";
            d.block = {
                multiSelect: d.multiSelect,
                attributes: d.attributes
            };
            c._ = {
                panelDefinition: d,
                items: {},
                state: 2
            };
        },
        statics: {
            handler: {
                create: function (a) {
                    return new k.richCombo(a);
                }
            }
        },
        proto: {
            renderHtml: function (a) {
                var b = [];
                this.render(a, b);
                return b.join("");
            },
            render: function (f, g) {
                var i = b, j = "cke_" + this.id, k = e.addFunction(function (a) {
                    var b = this;
                    var c = b._;
                    if (0 == c.state) return;
                    b.createPanel(f);
                    if (c.on) {
                        c.panel.hide();
                        return;
                    }
                    b.commit();
                    var d = b.getValue();
                    if (d) c.list.mark(d); else c.list.unmarkAll();
                    c.panel.showBlock(b.id, new h(a), 4);
                }, this), l = {
                    id: j,
                    combo: this,
                    focus: function () {
                        var b = a.document.getById(j).getChild(1);
                        b.focus();
                    },
                    clickFn: k
                };
                function m() {
                    var a = this;
                    var b = a.modes[f.mode] ? 2 : 0;
                    a.setState(f.readOnly && !a.readOnly ? 0 : b);
                    a.setValue("");
                }
                f.on("mode", m, this);
                !this.readOnly && f.on("readOnly", m, this);
                var n = e.addFunction(function (a, b) {
                    a = new d.event(a);
                    var c = a.getKeystroke();
                    switch (c) {
                        case 13:
                        case 32:
                        case 40:
                            e.callFunction(k, b);
                            break;

                        default:
                            l.onkey(l, c);
                    }
                    a.preventDefault();
                }), o = e.addFunction(function () {
                    l.onfocus && l.onfocus();
                });
                l.keyDownFn = n;
                g.push('<span class="cke_rcombo" role="presentation">', "<span id=", j);
                if (this.className) g.push(' class="', this.className, ' cke_off"');
                g.push(' role="presentation">', '<span id="' + j + '_label" class=cke_label>', this.label, "</span>", '<a hidefocus=true title="', this.title, '" tabindex="-1"', i.gecko && i.version >= 10900 && !i.hc ? "" : " href=\"javascript:void('" + this.label + "')\"", ' role="button" aria-labelledby="', j, '_label" aria-describedby="', j, '_text" aria-haspopup="true"');
                if (b.opera || b.gecko && b.mac) g.push(' onkeypress="return false;"');
                if (b.gecko) g.push(' onblur="this.style.cssText = this.style.cssText;"');
                g.push(' onkeydown="CKEDITOR.tools.callFunction( ', n, ', event, this );" onfocus="return CKEDITOR.tools.callFunction(', o, ', event);" ' + (c ? 'onclick="return false;" onmouseup' : "onclick") + '="CKEDITOR.tools.callFunction(', k, ', this); return false;"><span><span id="' + j + '_text" class="cke_text cke_inline_label">' + this.label + "</span>" + "</span>" + "<span class=cke_openbutton><span class=cke_icon>" + (b.hc ? "&#9660;" : b.air ? "&nbsp;" : "") + "</span></span>" + "</a>" + "</span>" + "</span>");
                if (this.onRender) this.onRender();
                return l;
            },
            createPanel: function (b) {
                if (this._.panel) return;
                var c = this._.panelDefinition, d = this._.panelDefinition.block, e = c.parent || a.document.getBody(), f = new k.floatPanel(b, e, c), g = f.addListBlock(this.id, d), h = this;
                f.onShow = function () {
                    if (h.className) this.element.getFirst().addClass(h.className + "_panel");
                    h.setState(1);
                    g.focus(!h.multiSelect && h.getValue());
                    h._.on = 1;
                    if (h.onOpen) h.onOpen();
                };
                f.onHide = function (a) {
                    if (h.className) this.element.getFirst().removeClass(h.className + "_panel");
                    h.setState(h.modes && h.modes[b.mode] ? 2 : 0);
                    h._.on = 0;
                    if (!a && h.onClose) h.onClose();
                };
                f.onEscape = function () {
                    f.hide();
                };
                g.onClick = function (a, b) {
                    h.document.getWindow().focus();
                    if (h.onClick) h.onClick.call(h, a, b);
                    if (b) h.setValue(a, h._.items[a]); else h.setValue("");
                    f.hide(false);
                };
                this._.panel = f;
                this._.list = g;
                f.getBlock(this.id).onHide = function () {
                    h._.on = 0;
                    h.setState(2);
                };
                if (this.init) this.init();
            },
            setValue: function (a, b) {
                var c = this;
                c._.value = a;
                var d = c.document.getById("cke_" + c.id + "_text");
                if (d) {
                    if (!(a || b)) {
                        b = c.label;
                        d.addClass("cke_inline_label");
                    } else d.removeClass("cke_inline_label");
                    d.setHtml("undefined" != typeof b ? b : a);
                }
            },
            getValue: function () {
                return this._.value || "";
            },
            unmarkAll: function () {
                this._.list.unmarkAll();
            },
            mark: function (a) {
                this._.list.mark(a);
            },
            hideItem: function (a) {
                this._.list.hideItem(a);
            },
            hideGroup: function (a) {
                this._.list.hideGroup(a);
            },
            showAll: function () {
                this._.list.showAll();
            },
            add: function (a, b, c) {
                this._.items[a] = c || a;
                this._.list.add(a, b, c);
            },
            startGroup: function (a) {
                this._.list.startGroup(a);
            },
            commit: function () {
                var a = this;
                if (!a._.committed) {
                    a._.list.commit();
                    a._.committed = 1;
                    k.fire("ready", a);
                }
                a._.committed = 1;
            },
            setState: function (a) {
                var b = this;
                if (b._.state == a) return;
                b.document.getById("cke_" + b.id).setState(a);
                b._.state = a;
            }
        }
    });
    k.prototype.addRichCombo = function (a, b) {
        this.add(a, "richcombo", b);
    };
    j.add("htmlwriter");
    a.htmlWriter = e.createClass({
        base: a.htmlParser.basicWriter,
        $: function () {
            var a = this;
            a.base();
            a.indentationChars = "	";
            a.selfClosingEnd = " />";
            a.lineBreakChars = "\n";
            a.forceSimpleAmpersand = 0;
            a.sortAttributes = 1;
            a._.indent = 0;
            a._.indentation = "";
            a._.inPre = 0;
            a._.rules = {};
            var b = f;
            for (var c in e.extend({}, b.$nonBodyContent, b.$block, b.$listItem, b.$tableContent)) a.setRules(c, {
                indent: 1,
                breakBeforeOpen: 1,
                breakAfterOpen: 1,
                breakBeforeClose: !b[c]["#"],
                breakAfterClose: 1
            });
            a.setRules("br", {
                breakAfterOpen: 1
            });
            a.setRules("title", {
                indent: 0,
                breakAfterOpen: 0
            });
            a.setRules("style", {
                indent: 0,
                breakBeforeClose: 1
            });
            a.setRules("pre", {
                indent: 0
            });
        },
        proto: {
            openTag: function (a, b) {
                var c = this;
                var d = c._.rules[a];
                if (c._.indent) c.indentation(); else if (d && d.breakBeforeOpen) {
                    c.lineBreak();
                    c.indentation();
                }
                c._.output.push("<", a);
            },
            openTagClose: function (a, b) {
                var c = this;
                var d = c._.rules[a];
                if (b) c._.output.push(c.selfClosingEnd); else {
                    c._.output.push(">");
                    if (d && d.indent) c._.indentation += c.indentationChars;
                }
                if (d && d.breakAfterOpen) c.lineBreak();
                "pre" == a && (c._.inPre = 1);
            },
            attribute: function (a, b) {
                if ("string" == typeof b) {
                    this.forceSimpleAmpersand && (b = b.replace(/&amp;/g, "&"));
                    b = e.htmlEncodeAttr(b);
                }
                this._.output.push(" ", a, '="', b, '"');
            },
            closeTag: function (a) {
                var b = this;
                var c = b._.rules[a];
                if (c && c.indent) b._.indentation = b._.indentation.substr(b.indentationChars.length);
                if (b._.indent) b.indentation(); else if (c && c.breakBeforeClose) {
                    b.lineBreak();
                    b.indentation();
                }
                b._.output.push("</", a, ">");
                "pre" == a && (b._.inPre = 0);
                if (c && c.breakAfterClose) b.lineBreak();
            },
            text: function (a) {
                var b = this;
                if (b._.indent) {
                    b.indentation();
                    !b._.inPre && (a = e.ltrim(a));
                }
                b._.output.push(a);
            },
            comment: function (a) {
                if (this._.indent) this.indentation();
                this._.output.push("<!--", a, "-->");
            },
            lineBreak: function () {
                var a = this;
                if (!a._.inPre && a._.output.length > 0) a._.output.push(a.lineBreakChars);
                a._.indent = 1;
            },
            indentation: function () {
                var a = this;
                if (!a._.inPre) a._.output.push(a._.indentation);
                a._.indent = 0;
            },
            setRules: function (a, b) {
                var c = this._.rules[a];
                if (c) e.extend(c, b, true); else this._.rules[a] = b;
            }
        }
    });
    j.add("menubutton", {
        requires: ["button", "menu"],
        beforeInit: function (a) {
            a.ui.addHandler("menubutton", k.menuButton.handler);
        }
    });
    a.UI_MENUBUTTON = "menubutton";
    !function () {
        var b = function (b) {
            var c = this._;
            if (0 === c.state) return;
            c.previousState = c.state;
            var d = c.menu;
            if (!d) {
                d = c.menu = new a.menu(b, {
                    panel: {
                        className: b.skinClass + " cke_contextmenu",
                        attributes: {
                            "aria-label": b.lang.common.options
                        }
                    }
                });
                d.onHide = e.bind(function () {
                    this.setState(this.modes && this.modes[b.mode] ? c.previousState : 0);
                }, this);
                if (this.onMenu) d.addListener(this.onMenu);
            }
            if (c.on) {
                d.hide();
                return;
            }
            this.setState(1);
            d.show(a.document.getById(this._.id), 4);
        };
        k.menuButton = e.createClass({
            base: k.button,
            $: function (a) {
                var c = a.panel;
                delete a.panel;
                this.base(a);
                this.hasArrow = true;
                this.click = b;
            },
            statics: {
                handler: {
                    create: function (a) {
                        return new k.menuButton(a);
                    }
                }
            }
        });
    }();
    j.add("dialogui");
    !function () {
        var f = function (a) {
            var b = this;
            b._ || (b._ = {});
            b._["default"] = b._.initValue = a["default"] || "";
            b._.required = a.required || false;
            var c = [b._];
            for (var d = 1; d < arguments.length; d++) c.push(arguments[d]);
            c.push(true);
            e.extend.apply(e, c);
            return b._;
        }, g = {
            build: function (a, b, c) {
                return new k.dialog.textInput(a, b, c);
            }
        }, i = {
            build: function (a, b, c) {
                return new k.dialog[b.type](a, b, c);
            }
        }, j = {
            build: function (b, c, d) {
                var e = c.children, f, g = [], h = [];
                for (var i = 0; i < e.length && (f = e[i]); i++) {
                    var j = [];
                    g.push(j);
                    h.push(a.dialog._.uiElementBuilders[f.type].build(b, f, j));
                }
                return new k.dialog[c.type](b, h, g, d, c);
            }
        }, l = {
            isChanged: function () {
                return this.getValue() != this.getInitValue();
            },
            reset: function (a) {
                this.setValue(this.getInitValue(), a);
            },
            setInitValue: function () {
                this._.initValue = this.getValue();
            },
            resetInitValue: function () {
                this._.initValue = this._["default"];
            },
            getInitValue: function () {
                return this._.initValue;
            }
        }, m = e.extend({}, k.dialog.uiElement.prototype.eventProcessors, {
            onChange: function (a, b) {
                if (!this._.domOnChangeRegistered) {
                    a.on("load", function () {
                        this.getInputElement().on("change", function () {
                            if (!a.parts.dialog.isVisible()) return;
                            this.fire("change", {
                                value: this.getValue()
                            });
                        }, this);
                    }, this);
                    this._.domOnChangeRegistered = true;
                }
                this.on("change", b);
            }
        }, true), n = /^on([A-Z]\w+)/, o = function (a) {
            for (var b in a) if (n.test(b) || "title" == b || "type" == b) delete a[b];
            return a;
        };
        e.extend(k.dialog, {
            labeledElement: function (b, c, d, g) {
                if (arguments.length < 4) return;
                var h = f.call(this, c);
                h.labelId = e.getNextId() + "_label";
                var i = this._.children = [], j = function () {
                    var d = [], f = c.required ? " cke_required" : "";
                    if ("horizontal" != c.labelLayout) d.push('<label class="cke_dialog_ui_labeled_label' + f + '" ', ' id="' + h.labelId + '"', h.inputId ? ' for="' + h.inputId + '"' : "", (c.labelStyle ? ' style="' + c.labelStyle + '"' : "") + ">", c.label, "</label>", '<div class="cke_dialog_ui_labeled_content"' + (c.controlStyle ? ' style="' + c.controlStyle + '"' : "") + ' role="presentation">', g.call(this, b, c), "</div>"); else {
                        var i = {
                            type: "hbox",
                            widths: c.widths,
                            padding: 0,
                            children: [{
                                type: "html",
                                html: '<label class="cke_dialog_ui_labeled_label' + f + '"' + ' id="' + h.labelId + '"' + ' for="' + h.inputId + '"' + (c.labelStyle ? ' style="' + c.labelStyle + '"' : "") + ">" + e.htmlEncode(c.label) + "</span>"
                            }, {
                                type: "html",
                                html: '<span class="cke_dialog_ui_labeled_content"' + (c.controlStyle ? ' style="' + c.controlStyle + '"' : "") + ">" + g.call(this, b, c) + "</span>"
                            }]
                        };
                        a.dialog._.uiElementBuilders.hbox.build(b, i, d);
                    }
                    return d.join("");
                };
                k.dialog.uiElement.call(this, b, c, d, "div", null, {
                    role: "presentation"
                }, j);
            },
            textInput: function (a, b, c) {
                if (arguments.length < 3) return;
                f.call(this, b);
                var d = this._.inputId = e.getNextId() + "_textInput", g = {
                    "class": "cke_dialog_ui_input_" + b.type,
                    id: d,
                    type: b.type
                }, h;
                if (b.validate) this.validate = b.validate;
                if (b.maxLength) g.maxlength = b.maxLength;
                if (b.size) g.size = b.size;
                if (b.inputStyle) g.style = b.inputStyle;
                var i = function () {
                    var a = ['<div class="cke_dialog_ui_input_', b.type, '" role="presentation"'];
                    if (b.width) a.push('style="width:' + b.width + '" ');
                    a.push("><input ");
                    g["aria-labelledby"] = this._.labelId;
                    this._.required && (g["aria-required"] = this._.required);
                    for (var c in g) a.push(c + '="' + g[c] + '" ');
                    a.push(" /></div>");
                    return a.join("");
                };
                k.dialog.labeledElement.call(this, a, b, c, i);
            },
            textarea: function (a, b, c) {
                if (arguments.length < 3) return;
                f.call(this, b);
                var d = this, g = this._.inputId = e.getNextId() + "_textarea", h = {};
                if (b.validate) this.validate = b.validate;
                h.rows = b.rows || 5;
                h.cols = b.cols || 20;
                if ("undefined" != typeof b.inputStyle) h.style = b.inputStyle;
                var i = function () {
                    h["aria-labelledby"] = this._.labelId;
                    this._.required && (h["aria-required"] = this._.required);
                    var a = ['<div class="cke_dialog_ui_input_textarea" role="presentation"><textarea class="cke_dialog_ui_input_textarea" id="', g, '" '];
                    for (var b in h) a.push(b + '="' + e.htmlEncode(h[b]) + '" ');
                    a.push(">", e.htmlEncode(d._["default"]), "</textarea></div>");
                    return a.join("");
                };
                k.dialog.labeledElement.call(this, a, b, c, i);
            },
            checkbox: function (a, b, c) {
                if (arguments.length < 3) return;
                var d = f.call(this, b, {
                    "default": !!b["default"]
                });
                if (b.validate) this.validate = b.validate;
                var g = function () {
                    var c = e.extend({}, b, {
                        id: b.id ? b.id + "_checkbox" : e.getNextId() + "_checkbox"
                    }, true), f = [], g = e.getNextId() + "_label", h = {
                        "class": "cke_dialog_ui_checkbox_input",
                        type: "checkbox",
                        "aria-labelledby": g
                    };
                    o(c);
                    if (b["default"]) h.checked = "checked";
                    if ("undefined" != typeof c.inputStyle) c.style = c.inputStyle;
                    d.checkbox = new k.dialog.uiElement(a, c, f, "input", null, h);
                    f.push(' <label id="', g, '" for="', h.id, '"' + (b.labelStyle ? ' style="' + b.labelStyle + '"' : "") + ">", e.htmlEncode(b.label), "</label>");
                    return f.join("");
                };
                k.dialog.uiElement.call(this, a, b, c, "span", null, null, g);
            },
            radio: function (a, b, c) {
                if (arguments.length < 3) return;
                f.call(this, b);
                if (!this._["default"]) this._["default"] = this._.initValue = b.items[0][1];
                if (b.validate) this.validate = b.valdiate;
                var d = [], g = this, h = function () {
                    var c = [], f = [], h = {
                        "class": "cke_dialog_ui_radio_item",
                        "aria-labelledby": this._.labelId
                    }, i = b.id ? b.id + "_radio" : e.getNextId() + "_radio";
                    for (var j = 0; j < b.items.length; j++) {
                        var l = b.items[j], m = void 0 !== l[2] ? l[2] : l[0], n = void 0 !== l[1] ? l[1] : l[0], p = e.getNextId() + "_radio_input", q = p + "_label", r = e.extend({}, b, {
                            id: p,
                            title: null,
                            type: null
                        }, true), s = e.extend({}, r, {
                            title: m
                        }, true), t = {
                            type: "radio",
                            "class": "cke_dialog_ui_radio_input",
                            name: i,
                            value: n,
                            "aria-labelledby": q
                        }, u = [];
                        if (g._["default"] == n) t.checked = "checked";
                        o(r);
                        o(s);
                        if ("undefined" != typeof r.inputStyle) r.style = r.inputStyle;
                        d.push(new k.dialog.uiElement(a, r, u, "input", null, t));
                        u.push(" ");
                        new k.dialog.uiElement(a, s, u, "label", null, {
                            id: q,
                            "for": t.id
                        }, l[0]);
                        c.push(u.join(""));
                    }
                    new k.dialog.hbox(a, d, c, f);
                    return f.join("");
                };
                k.dialog.labeledElement.call(this, a, b, c, h);
                this._.children = d;
            },
            button: function (b, c, d) {
                if (!arguments.length) return;
                if ("function" == typeof c) c = c(b.getParentEditor());
                f.call(this, c, {
                    disabled: c.disabled || false
                });
                a.event.implementOn(this);
                var g = this;
                b.on("load", function (a) {
                    var b = this.getElement();
                    !function () {
                        b.on("click", function (a) {
                            g.fire("click", {
                                dialog: g.getDialog()
                            });
                            a.data.preventDefault();
                        });
                        b.on("keydown", function (a) {
                            if (a.data.getKeystroke() in {
                                32: 1
                            }) {
                                g.click();
                                a.data.preventDefault();
                            }
                        });
                    }();
                    b.unselectable();
                }, this);
                var h = e.extend({}, c);
                delete h.style;
                var i = e.getNextId() + "_label";
                k.dialog.uiElement.call(this, b, h, d, "a", null, {
                    style: c.style,
                    href: "javascript:void(0)",
                    title: c.label,
                    hidefocus: "true",
                    "class": c["class"],
                    role: "button",
                    "aria-labelledby": i
                }, '<span id="' + i + '" class="cke_dialog_ui_button">' + e.htmlEncode(c.label) + "</span>");
            },
            select: function (a, b, c) {
                if (arguments.length < 3) return;
                var d = f.call(this, b);
                if (b.validate) this.validate = b.validate;
                d.inputId = e.getNextId() + "_select";
                var g = function () {
                    var c = e.extend({}, b, {
                        id: b.id ? b.id + "_select" : e.getNextId() + "_select"
                    }, true), f = [], g = [], h = {
                        id: d.inputId,
                        "class": "cke_dialog_ui_input_select",
                        "aria-labelledby": this._.labelId
                    };
                    if (void 0 != b.size) h.size = b.size;
                    if (void 0 != b.multiple) h.multiple = b.multiple;
                    o(c);
                    for (var i = 0, j; i < b.items.length && (j = b.items[i]); i++) g.push('<option value="', e.htmlEncode(void 0 !== j[1] ? j[1] : j[0]).replace(/"/g, "&quot;"), '" /> ', e.htmlEncode(j[0]));
                    if ("undefined" != typeof c.inputStyle) c.style = c.inputStyle;
                    d.select = new k.dialog.uiElement(a, c, f, "select", null, h, g.join(""));
                    return f.join("");
                };
                k.dialog.labeledElement.call(this, a, b, c, g);
            },
            file: function (c, d, g) {
                if (arguments.length < 3) return;
                if (void 0 === d["default"]) d["default"] = "";
                var h = e.extend(f.call(this, d), {
                    definition: d,
                    buttons: []
                });
                if (d.validate) this.validate = d.validate;
                var i = function () {
                    h.frameId = e.getNextId() + "_fileInput";
                    var a = b.isCustomDomain(), c = ['<iframe frameborder="0" allowtransparency="0" class="cke_dialog_ui_input_file" role="presentation" id="', h.frameId, '" title="', d.label, '" src="javascript:void('];
                    c.push(a ? "(function(){document.open();document.domain='" + document.domain + "';" + "document.close();" + "})()" : "0");
                    c.push(')"></iframe>');
                    return c.join("");
                };
                c.on("load", function () {
                    var b = a.document.getById(h.frameId), c = b.getParent();
                    c.addClass("cke_dialog_ui_input_file");
                });
                k.dialog.labeledElement.call(this, c, d, g, i);
            },
            fileButton: function (a, b, c) {
                if (arguments.length < 3) return;
                var d = f.call(this, b), g = this;
                if (b.validate) this.validate = b.validate;
                var h = e.extend({}, b), i = h.onClick;
                h.className = (h.className ? h.className + " " : "") + "cke_dialog_ui_button";
                h.onClick = function (c) {
                    var d = b["for"];
                    if (!i || false !== i.call(this, c)) {
                        a.getContentElement(d[0], d[1]).submit();
                        this.disable();
                    }
                };
                a.on("load", function () {
                    a.getContentElement(b["for"][0], b["for"][1])._.buttons.push(g);
                });
                k.dialog.button.call(this, a, h, c);
            },
            html: function () {
                var a = /^\s*<[\w:]+\s+([^>]*)?>/, b = /^(\s*<[\w:]+(?:\s+[^>]*)?)((?:.|\r|\n)+)$/, c = /\/$/;
                return function (d, e, f) {
                    if (arguments.length < 3) return;
                    var g = [], h, i = e.html, j, l;
                    if ("<" != i.charAt(0)) i = "<span>" + i + "</span>";
                    var m = e.focus;
                    if (m) {
                        var n = this.focus;
                        this.focus = function () {
                            n.call(this);
                            "function" == typeof m && m.call(this);
                            this.fire("focus");
                        };
                        if (e.isFocusable) {
                            var o = this.isFocusable;
                            this.isFocusable = o;
                        }
                        this.keyboardFocusable = true;
                    }
                    k.dialog.uiElement.call(this, d, e, g, "span", null, null, "");
                    h = g.join("");
                    j = h.match(a);
                    l = i.match(b) || ["", "", ""];
                    if (c.test(l[1])) {
                        l[1] = l[1].slice(0, -1);
                        l[2] = "/" + l[2];
                    }
                    f.push([l[1], " ", j[1] || "", l[2]].join(""));
                };
            }(),
            fieldset: function (a, b, c, d, e) {
                var f = e.label, g = function () {
                    var a = [];
                    f && a.push("<legend" + (e.labelStyle ? ' style="' + e.labelStyle + '"' : "") + ">" + f + "</legend>");
                    for (var b = 0; b < c.length; b++) a.push(c[b]);
                    return a.join("");
                };
                this._ = {
                    children: b
                };
                k.dialog.uiElement.call(this, a, e, d, "fieldset", null, null, g);
            }
        }, true);
        k.dialog.html.prototype = new k.dialog.uiElement();
        k.dialog.labeledElement.prototype = e.extend(new k.dialog.uiElement(), {
            setLabel: function (b) {
                var c = a.document.getById(this._.labelId);
                if (c.getChildCount() < 1) new d.text(b, a.document).appendTo(c); else c.getChild(0).$.nodeValue = b;
                return this;
            },
            getLabel: function () {
                var b = a.document.getById(this._.labelId);
                if (!b || b.getChildCount() < 1) return ""; else return b.getChild(0).getText();
            },
            eventProcessors: m
        }, true);
        k.dialog.button.prototype = e.extend(new k.dialog.uiElement(), {
            click: function () {
                var a = this;
                if (!a._.disabled) return a.fire("click", {
                    dialog: a._.dialog
                });
                a.getElement().$.blur();
                return false;
            },
            enable: function () {
                this._.disabled = false;
                var a = this.getElement();
                a && a.removeClass("cke_disabled");
            },
            disable: function () {
                this._.disabled = true;
                this.getElement().addClass("cke_disabled");
            },
            isVisible: function () {
                return this.getElement().getFirst().isVisible();
            },
            isEnabled: function () {
                return !this._.disabled;
            },
            eventProcessors: e.extend({}, k.dialog.uiElement.prototype.eventProcessors, {
                onClick: function (a, b) {
                    this.on("click", function () {
                        this.getElement().focus();
                        b.apply(this, arguments);
                    });
                }
            }, true),
            accessKeyUp: function () {
                this.click();
            },
            accessKeyDown: function () {
                this.focus();
            },
            keyboardFocusable: true
        }, true);
        k.dialog.textInput.prototype = e.extend(new k.dialog.labeledElement(), {
            getInputElement: function () {
                return a.document.getById(this._.inputId);
            },
            focus: function () {
                var a = this.selectParentTab();
                setTimeout(function () {
                    var b = a.getInputElement();
                    b && b.$.focus();
                }, 0);
            },
            select: function () {
                var a = this.selectParentTab();
                setTimeout(function () {
                    var b = a.getInputElement();
                    if (b) {
                        b.$.focus();
                        b.$.select();
                    }
                }, 0);
            },
            accessKeyUp: function () {
                this.select();
            },
            setValue: function (a) {
                !a && (a = "");
                return k.dialog.uiElement.prototype.setValue.apply(this, arguments);
            },
            keyboardFocusable: true
        }, l, true);
        k.dialog.textarea.prototype = new k.dialog.textInput();
        k.dialog.select.prototype = e.extend(new k.dialog.labeledElement(), {
            getInputElement: function () {
                return this._.select.getElement();
            },
            add: function (a, b, d) {
                var e = new h("option", this.getDialog().getParentEditor().document), f = this.getInputElement().$;
                e.$.text = a;
                e.$.value = void 0 === b || null === b ? a : b;
                if (void 0 === d || null === d) if (c) f.add(e.$); else f.add(e.$, null); else f.add(e.$, d);
                return this;
            },
            remove: function (a) {
                var b = this.getInputElement().$;
                b.remove(a);
                return this;
            },
            clear: function () {
                var a = this.getInputElement().$;
                while (a.length > 0) a.remove(0);
                return this;
            },
            keyboardFocusable: true
        }, l, true);
        k.dialog.checkbox.prototype = e.extend(new k.dialog.uiElement(), {
            getInputElement: function () {
                return this._.checkbox.getElement();
            },
            setValue: function (a, b) {
                this.getInputElement().$.checked = a;
                !b && this.fire("change", {
                    value: a
                });
            },
            getValue: function () {
                return this.getInputElement().$.checked;
            },
            accessKeyUp: function () {
                this.setValue(!this.getValue());
            },
            eventProcessors: {
                onChange: function (a, b) {
                    if (!c) return m.onChange.apply(this, arguments); else {
                        a.on("load", function () {
                            var a = this._.checkbox.getElement();
                            a.on("propertychange", function (b) {
                                b = b.data.$;
                                if ("checked" == b.propertyName) this.fire("change", {
                                    value: a.$.checked
                                });
                            }, this);
                        }, this);
                        this.on("change", b);
                    }
                    return null;
                }
            },
            keyboardFocusable: true
        }, l, true);
        k.dialog.radio.prototype = e.extend(new k.dialog.uiElement(), {
            setValue: function (a, b) {
                var c = this._.children, d;
                for (var e = 0; e < c.length && (d = c[e]); e++) d.getElement().$.checked = d.getValue() == a;
                !b && this.fire("change", {
                    value: a
                });
            },
            getValue: function () {
                var a = this._.children;
                for (var b = 0; b < a.length; b++) if (a[b].getElement().$.checked) return a[b].getValue();
                return null;
            },
            accessKeyUp: function () {
                var a = this._.children, b;
                for (b = 0; b < a.length; b++) if (a[b].getElement().$.checked) {
                    a[b].getElement().focus();
                    return;
                }
                a[0].getElement().focus();
            },
            eventProcessors: {
                onChange: function (a, b) {
                    if (!c) return m.onChange.apply(this, arguments); else {
                        a.on("load", function () {
                            var a = this._.children, b = this;
                            for (var c = 0; c < a.length; c++) {
                                var d = a[c].getElement();
                                d.on("propertychange", function (a) {
                                    a = a.data.$;
                                    if ("checked" == a.propertyName && this.$.checked) b.fire("change", {
                                        value: this.getAttribute("value")
                                    });
                                });
                            }
                        }, this);
                        this.on("change", b);
                    }
                    return null;
                }
            },
            keyboardFocusable: true
        }, l, true);
        k.dialog.file.prototype = e.extend(new k.dialog.labeledElement(), l, {
            getInputElement: function () {
                var b = a.document.getById(this._.frameId).getFrameDocument();
                return b.$.forms.length > 0 ? new h(b.$.forms[0].elements[0]) : this.getElement();
            },
            submit: function () {
                this.getInputElement().getParent().$.submit();
                return this;
            },
            getAction: function () {
                return this.getInputElement().getParent().$.action;
            },
            registerEvents: function (a) {
                var b = /^on([A-Z]\w+)/, c, d = function (a, b, c, d) {
                    a.on("formLoaded", function () {
                        a.getInputElement().on(c, d, a);
                    });
                };
                for (var e in a) {
                    if (!(c = e.match(b))) continue;
                    if (this.eventProcessors[e]) this.eventProcessors[e].call(this, this._.dialog, a[e]); else d(this, this._.dialog, c[1].toLowerCase(), a[e]);
                }
                return this;
            },
            reset: function () {
                var d = this._, f = a.document.getById(d.frameId), g = f.getFrameDocument(), h = d.definition, i = d.buttons, j = this.formLoadedNumber, k = this.formUnloadNumber, l = d.dialog._.editor.lang.dir, m = d.dialog._.editor.langCode;
                if (!j) {
                    j = this.formLoadedNumber = e.addFunction(function () {
                        this.fire("formLoaded");
                    }, this);
                    k = this.formUnloadNumber = e.addFunction(function () {
                        this.getInputElement().clearCustomData();
                    }, this);
                    this.getDialog()._.editor.on("destroy", function () {
                        e.removeFunction(j);
                        e.removeFunction(k);
                    });
                }
                function n() {
                    g.$.open();
                    if (b.isCustomDomain()) g.$.domain = document.domain;
                    var a = "";
                    if (h.size) a = h.size - (c ? 7 : 0);
                    var f = d.frameId + "_input";
                    g.$.write(['<html dir="' + l + '" lang="' + m + '"><head><title></title></head><body style="margin: 0; overflow: hidden; background: transparent;">', '<form enctype="multipart/form-data" method="POST" dir="' + l + '" lang="' + m + '" action="', e.htmlEncode(h.action), '">', '<label id="', d.labelId, '" for="', f, '" style="display:none">', e.htmlEncode(h.label), "</label>", '<input id="', f, '" aria-labelledby="', d.labelId, '" type="file" name="', e.htmlEncode(h.id || "cke_upload"), '" size="', e.htmlEncode(a > 0 ? a : ""), '" />', "</form>", "</body></html>", "<script>window.parent.CKEDITOR.tools.callFunction(" + j + ");", "window.onbeforeunload = function() {window.parent.CKEDITOR.tools.callFunction(" + k + ")}</script>"].join(""));
                    g.$.close();
                    for (var n = 0; n < i.length; n++) i[n].enable();
                }
                if (b.gecko) setTimeout(n, 500); else n();
            },
            getValue: function () {
                return this.getInputElement().$.value || "";
            },
            setInitValue: function () {
                this._.initValue = "";
            },
            eventProcessors: {
                onChange: function (a, b) {
                    if (!this._.domOnChangeRegistered) {
                        this.on("formLoaded", function () {
                            this.getInputElement().on("change", function () {
                                this.fire("change", {
                                    value: this.getValue()
                                });
                            }, this);
                        }, this);
                        this._.domOnChangeRegistered = true;
                    }
                    this.on("change", b);
                }
            },
            keyboardFocusable: true
        }, true);
        k.dialog.fileButton.prototype = new k.dialog.button();
        k.dialog.fieldset.prototype = e.clone(k.dialog.hbox.prototype);
        a.dialog.addUIElement("text", g);
        a.dialog.addUIElement("password", g);
        a.dialog.addUIElement("textarea", i);
        a.dialog.addUIElement("checkbox", i);
        a.dialog.addUIElement("radio", i);
        a.dialog.addUIElement("button", i);
        a.dialog.addUIElement("select", i);
        a.dialog.addUIElement("file", i);
        a.dialog.addUIElement("fileButton", i);
        a.dialog.addUIElement("html", i);
        a.dialog.addUIElement("fieldset", j);
    }();
    j.add("panel", {
        beforeInit: function (a) {
            a.ui.addHandler("panel", k.panel.handler);
        }
    });
    a.UI_PANEL = "panel";
    k.panel = function (a, b) {
        var c = this;
        if (b) e.extend(c, b);
        e.extend(c, {
            className: "",
            css: []
        });
        c.id = e.getNextId();
        c.document = a;
        c._ = {
            blocks: {}
        };
    };
    k.panel.handler = {
        create: function (a) {
            return new k.panel(a);
        }
    };
    k.panel.prototype = {
        renderHtml: function (a) {
            var b = [];
            this.render(a, b);
            return b.join("");
        },
        render: function (a, c) {
            var d = this;
            var e = d.id;
            c.push('<div class="', a.skinClass, '" lang="', a.langCode, '" role="presentation" style="display:none;z-index:' + (a.config.baseFloatZIndex + 1) + '">' + "<div" + " id=", e, " dir=", a.lang.dir, ' role="presentation" class="cke_panel cke_', a.lang.dir);
            if (d.className) c.push(" ", d.className);
            c.push('">');
            if (d.forceIFrame || d.css.length) {
                c.push('<iframe id="', e, '_frame" frameborder="0" role="application" src="javascript:void(');
                c.push(b.isCustomDomain() ? "(function(){document.open();document.domain='" + document.domain + "';" + "document.close();" + "})()" : "0");
                c.push(')"></iframe>');
            }
            c.push("</div></div>");
            return e;
        },
        getHolderElement: function () {
            var c = this._.holder;
            if (!c) {
                if (this.forceIFrame || this.css.length) {
                    var d = this.document.getById(this.id + "_frame"), f = d.getParent(), g = f.getAttribute("dir"), h = f.getParent().getAttribute("class"), i = f.getParent().getAttribute("lang"), j = d.getFrameDocument();
                    b.iOS && f.setStyles({
                        overflow: "scroll",
                        "-webkit-overflow-scrolling": "touch"
                    });
                    var k = e.addFunction(e.bind(function (a) {
                        this.isLoaded = true;
                        if (this.onLoad) this.onLoad();
                    }, this)), l = '<!DOCTYPE html><html dir="' + g + '" class="' + h + '_container" lang="' + i + '">' + "<head>" + "<style>." + h + "_container{visibility:hidden}</style>" + e.buildStyleHtml(this.css) + "</head>" + '<body class="cke_' + g + " cke_panel_frame " + b.cssClass + '" style="margin:0;padding:0"' + ' onload="( window.CKEDITOR || window.parent.CKEDITOR ).tools.callFunction(' + k + ');"></body>' + "</html>";
                    j.write(l);
                    var m = j.getWindow();
                    m.$.CKEDITOR = a;
                    j.on("key" + (b.opera ? "press" : "down"), function (a) {
                        var b = this;
                        var c = a.data.getKeystroke(), d = b.document.getById(b.id).getAttribute("dir");
                        if (b._.onKeyDown && false === b._.onKeyDown(c)) {
                            a.data.preventDefault();
                            return;
                        }
                        if (27 == c || c == ("rtl" == d ? 39 : 37)) if (b.onEscape && false === b.onEscape(c)) a.data.preventDefault();
                    }, this);
                    c = j.getBody();
                    c.unselectable();
                    b.air && e.callFunction(k);
                } else c = this.document.getById(this.id);
                this._.holder = c;
            }
            return c;
        },
        addBlock: function (a, b) {
            var c = this;
            b = c._.blocks[a] = b instanceof k.panel.block ? b : new k.panel.block(c.getHolderElement(), b);
            if (!c._.currentBlock) c.showBlock(a);
            return b;
        },
        getBlock: function (a) {
            return this._.blocks[a];
        },
        showBlock: function (b) {
            var d = this;
            var f = d._.blocks, g = f[b], h = d._.currentBlock, i = !d.forceIFrame || c ? d._.holder : d.document.getById(d.id + "_frame");
            if (h) {
                i.removeAttributes(h.attributes);
                h.hide();
            }
            d._.currentBlock = g;
            i.setAttributes(g.attributes);
            a.fire("ariaWidget", i);
            g._.focusIndex = -1;
            d._.onKeyDown = g.onKeyDown && e.bind(g.onKeyDown, g);
            g.show();
            return g;
        },
        destroy: function () {
            this.element && this.element.remove();
        }
    };
    k.panel.block = e.createClass({
        $: function (a, b) {
            var c = this;
            c.element = a.append(a.getDocument().createElement("div", {
                attributes: {
                    tabIndex: -1,
                    "class": "cke_panel_block",
                    role: "presentation"
                },
                styles: {
                    display: "none"
                }
            }));
            if (b) e.extend(c, b);
            if (!c.attributes.title) c.attributes.title = c.attributes["aria-label"];
            c.keys = {};
            c._.focusIndex = -1;
            c.element.disableContextMenu();
        },
        _: {
            markItem: function (a) {
                var c = this;
                if (a == -1) return;
                var d = c.element.getElementsByTag("a"), e = d.getItem(c._.focusIndex = a);
                if (b.webkit || b.opera) e.getDocument().getWindow().focus();
                e.focus();
                c.onMark && c.onMark(e);
            }
        },
        proto: {
            show: function () {
                this.element.setStyle("display", "");
            },
            hide: function () {
                var a = this;
                if (!a.onHide || true !== a.onHide.call(a)) a.element.setStyle("display", "none");
            },
            onKeyDown: function (a) {
                var b = this;
                var c = b.keys[a];
                switch (c) {
                    case "next":
                        var d = b._.focusIndex, e = b.element.getElementsByTag("a"), f;
                        while (f = e.getItem(++d)) if (f.getAttribute("_cke_focus") && f.$.offsetWidth) {
                            b._.focusIndex = d;
                            f.focus();
                            break;
                        }
                        return false;

                    case "prev":
                        d = b._.focusIndex;
                        e = b.element.getElementsByTag("a");
                        while (d > 0 && (f = e.getItem(--d))) if (f.getAttribute("_cke_focus") && f.$.offsetWidth) {
                            b._.focusIndex = d;
                            f.focus();
                            break;
                        }
                        return false;

                    case "click":
                    case "mouseup":
                        d = b._.focusIndex;
                        f = d >= 0 && b.element.getElementsByTag("a").getItem(d);
                        if (f) f.$[c] ? f.$[c]() : f.$["on" + c]();
                        return false;
                }
                return true;
            }
        }
    });
    j.add("listblock", {
        requires: ["panel"],
        onLoad: function () {
            k.panel.prototype.addListBlock = function (a, b) {
                return this.addBlock(a, new k.listBlock(this.getHolderElement(), b));
            };
            k.listBlock = e.createClass({
                base: k.panel.block,
                $: function (a, b) {
                    var d = this;
                    b = b || {};
                    var e = b.attributes || (b.attributes = {});
                    (d.multiSelect = !!b.multiSelect) && (e["aria-multiselectable"] = true);
                    !e.role && (e.role = "listbox");
                    d.base.apply(d, arguments);
                    var f = d.keys;
                    f[40] = "next";
                    f[9] = "next";
                    f[38] = "prev";
                    f[2228224 + 9] = "prev";
                    f[32] = c ? "mouseup" : "click";
                    c && (f[13] = "mouseup");
                    d._.pendingHtml = [];
                    d._.items = {};
                    d._.groups = {};
                },
                _: {
                    close: function () {
                        if (this._.started) {
                            this._.pendingHtml.push("</ul>");
                            delete this._.started;
                        }
                    },
                    getClick: function () {
                        if (!this._.click) this._.click = e.addFunction(function (a) {
                            var b = this;
                            var c = true;
                            if (b.multiSelect) c = b.toggle(a); else b.mark(a);
                            if (b.onClick) b.onClick(a, c);
                        }, this);
                        return this._.click;
                    }
                },
                proto: {
                    add: function (a, b, d) {
                        var f = this;
                        var g = f._.pendingHtml, h = e.getNextId();
                        if (!f._.started) {
                            g.push('<ul role="presentation" class=cke_panel_list>');
                            f._.started = 1;
                            f._.size = f._.size || 0;
                        }
                        f._.items[a] = h;
                        g.push("<li id=", h, ' class=cke_panel_listItem role=presentation><a id="', h, '_option" _cke_focus=1 hidefocus=true title="', d || a, '" href="javascript:void(\'', a, "')\" " + (c ? 'onclick="return false;" onmouseup' : "onclick") + '="CKEDITOR.tools.callFunction(', f._.getClick(), ",'", a, "'); return false;\"", ' role="option">', b || a, "</a></li>");
                    },
                    startGroup: function (a) {
                        this._.close();
                        var b = e.getNextId();
                        this._.groups[a] = b;
                        this._.pendingHtml.push('<h1 role="presentation" id=', b, " class=cke_panel_grouptitle>", a, "</h1>");
                    },
                    commit: function () {
                        var a = this;
                        a._.close();
                        a.element.appendHtml(a._.pendingHtml.join(""));
                        delete a._.size;
                        a._.pendingHtml = [];
                    },
                    toggle: function (a) {
                        var b = this.isMarked(a);
                        if (b) this.unmark(a); else this.mark(a);
                        return !b;
                    },
                    hideGroup: function (a) {
                        var b = this.element.getDocument().getById(this._.groups[a]), c = b && b.getNext();
                        if (b) {
                            b.setStyle("display", "none");
                            if (c && "ul" == c.getName()) c.setStyle("display", "none");
                        }
                    },
                    hideItem: function (a) {
                        this.element.getDocument().getById(this._.items[a]).setStyle("display", "none");
                    },
                    showAll: function () {
                        var a = this._.items, b = this._.groups, c = this.element.getDocument();
                        for (var d in a) c.getById(a[d]).setStyle("display", "");
                        for (var e in b) {
                            var f = c.getById(b[e]), g = f.getNext();
                            f.setStyle("display", "");
                            if (g && "ul" == g.getName()) g.setStyle("display", "");
                        }
                    },
                    mark: function (a) {
                        var b = this;
                        if (!b.multiSelect) b.unmarkAll();
                        var c = b._.items[a], d = b.element.getDocument().getById(c);
                        d.addClass("cke_selected");
                        b.element.getDocument().getById(c + "_option").setAttribute("aria-selected", true);
                        b.onMark && b.onMark(d);
                    },
                    unmark: function (a) {
                        var b = this;
                        var c = b.element.getDocument(), d = b._.items[a], e = c.getById(d);
                        e.removeClass("cke_selected");
                        c.getById(d + "_option").removeAttribute("aria-selected");
                        b.onUnmark && b.onUnmark(e);
                    },
                    unmarkAll: function () {
                        var a = this;
                        var b = a._.items, c = a.element.getDocument();
                        for (var d in b) {
                            var e = b[d];
                            c.getById(e).removeClass("cke_selected");
                            c.getById(e + "_option").removeAttribute("aria-selected");
                        }
                        a.onUnmark && a.onUnmark();
                    },
                    isMarked: function (a) {
                        return this.element.getDocument().getById(this._.items[a]).hasClass("cke_selected");
                    },
                    focus: function (a) {
                        this._.focusIndex = -1;
                        if (a) {
                            var b = this.element.getDocument().getById(this._.items[a]).getFirst(), c = this.element.getElementsByTag("a"), d, e = -1;
                            while (d = c.getItem(++e)) if (d.equals(b)) {
                                this._.focusIndex = e;
                                break;
                            }
                            setTimeout(function () {
                                b.focus();
                            }, 0);
                        }
                    }
                }
            });
        }
    });
    a.themes.add("default", function () {
        var d = {};
        function f(c, d) {
            var e, f;
            f = c.config.sharedSpaces;
            f = f && f[d];
            f = f && a.document.getById(f);
            if (f) {
                var g = '<span class="cke_shared " dir="' + c.lang.dir + '"' + ">" + '<span class="' + c.skinClass + " " + c.id + " cke_editor_" + c.name + '">' + '<span class="' + b.cssClass + '">' + '<span class="cke_wrapper cke_' + c.lang.dir + '">' + '<span class="cke_editor">' + '<div class="cke_' + d + '">' + "</div></span></span></span></span></span>", i = f.append(h.createFromHtml(g, f.getDocument()));
                if (f.getCustomData("cke_hasshared")) i.hide(); else f.setCustomData("cke_hasshared", 1);
                e = i.getChild([0, 0, 0, 0]);
                !c.sharedSpaces && (c.sharedSpaces = {});
                c.sharedSpaces[d] = e;
                c.on("focus", function () {
                    for (var a = 0, b, c = f.getChildren(); b = c.getItem(a); a++) if (1 == b.type && !b.equals(i) && b.hasClass("cke_shared")) b.hide();
                    i.show();
                });
                c.on("destroy", function () {
                    i.remove();
                });
            }
            return e;
        }
        return {
            build: function (a, c) {
                var e = a.name, g = a.element, i = a.elementMode;
                if (!g || 0 == i) return;
                if (1 == i) g.hide();
                var j = a.fire("themeSpace", {
                    space: "top",
                    html: ""
                }).html, k = a.fire("themeSpace", {
                    space: "contents",
                    html: ""
                }).html, l = a.fireOnce("themeSpace", {
                    space: "bottom",
                    html: ""
                }).html, m = k && a.config.height, n = a.config.tabIndex || a.element.getAttribute("tabindex") || 0;
                if (!k) m = "auto"; else if (!isNaN(m)) m += "px";
                var o = "", p = a.config.width;
                if (p) {
                    if (!isNaN(p)) p += "px";
                    o += "width: " + p + ";";
                }
                var q = j && f(a, "top"), r = f(a, "bottom");
                q && (q.setHtml(j), j = "");
                r && (r.setHtml(l), l = "");
                var s = "<style>." + a.skinClass + "{visibility:hidden;}</style>";
                if (d[a.skinClass]) s = ""; else d[a.skinClass] = 1;
                var t = h.createFromHtml(['<span id="cke_', e, '" class="', a.skinClass, " ", a.id, " cke_editor_", e, '" dir="', a.lang.dir, '" title="', b.gecko ? " " : "", '" lang="', a.langCode, '"' + (b.webkit ? ' tabindex="' + n + '"' : "") + ' role="application"' + ' aria-labelledby="cke_', e, '_arialbl"' + (o ? ' style="' + o + '"' : "") + ">" + '<span id="cke_', e, '_arialbl" class="cke_voice_label">' + a.lang.editor + "</span>" + '<span class="', b.cssClass, '" role="presentation"><span class="cke_wrapper cke_', a.lang.dir, '" role="presentation"><table class="cke_editor" border="0" cellspacing="0" cellpadding="0" role="presentation"><tbody><tr', j ? "" : ' style="display:none"', ' role="presentation"><td id="cke_top_', e, '" class="cke_top" role="presentation">', j, "</td></tr><tr", k ? "" : ' style="display:none"', ' role="presentation"><td id="cke_contents_', e, '" class="cke_contents" style="height:', m, '" role="presentation">', k, "</td></tr><tr", l ? "" : ' style="display:none"', ' role="presentation"><td id="cke_bottom_', e, '" class="cke_bottom" role="presentation">', l, "</td></tr></tbody></table>" + s + "</span>" + "</span>" + "</span>"].join(""));
                t.getChild([1, 0, 0, 0, 0]).unselectable();
                t.getChild([1, 0, 0, 0, 2]).unselectable();
                if (1 == i) t.insertAfter(g); else g.append(t);
                a.container = t;
                t.disableContextMenu();
                a.on("contentDirChanged", function (b) {
                    var c = (a.lang.dir != b.data ? "add" : "remove") + "Class";
                    t.getChild(1)[c]("cke_mixed_dir_content");
                    var d = this.sharedSpaces && this.sharedSpaces[this.config.toolbarLocation];
                    d && d.getParent().getParent()[c]("cke_mixed_dir_content");
                });
                a.fireOnce("themeLoaded");
                a.fireOnce("uiReady");
            },
            buildDialog: function (a) {
                var d = e.getNextNumber(), f = h.createFromHtml(['<div class="', a.id, "_dialog cke_editor_", a.name.replace(".", "\\."), "_dialog cke_skin_", a.skinName, '" dir="', a.lang.dir, '" lang="', a.langCode, '" role="dialog" aria-labelledby="%title#"><table class="cke_dialog', " " + b.cssClass, " cke_", a.lang.dir, '" style="position:absolute" role="presentation"><tr><td role="presentation"><div class="%body" role="presentation"><div id="%title#" class="%title" role="presentation"></div><a id="%close_button#" class="%close_button" href="javascript:void(0)" title="' + a.lang.common.close + '" role="button"><span class="cke_label">X</span></a>' + '<div id="%tabs#" class="%tabs" role="tablist"></div>' + '<table class="%contents" role="presentation">' + "<tr>" + '<td id="%contents#" class="%contents" role="presentation"></td>' + "</tr>" + "<tr>" + '<td id="%footer#" class="%footer" role="presentation"></td>' + "</tr>" + "</table>" + "</div>" + '<div id="%tl#" class="%tl"></div>' + '<div id="%tc#" class="%tc"></div>' + '<div id="%tr#" class="%tr"></div>' + '<div id="%ml#" class="%ml"></div>' + '<div id="%mr#" class="%mr"></div>' + '<div id="%bl#" class="%bl"></div>' + '<div id="%bc#" class="%bc"></div>' + '<div id="%br#" class="%br"></div>' + "</td></tr>" + "</table>", c ? "" : "<style>.cke_dialog{visibility:hidden;}</style>", "</div>"].join("").replace(/#/g, "_" + d).replace(/%/g, "cke_dialog_")), g = f.getChild([0, 0, 0, 0, 0]), i = g.getChild(0), j = g.getChild(1);
                if (c && !b.ie6Compat) {
                    var k = b.isCustomDomain(), l = "javascript:void(function(){" + encodeURIComponent("document.open();" + (k ? 'document.domain="' + document.domain + '";' : "") + "document.close();") + "}())", m = h.createFromHtml('<iframe frameBorder="0" class="cke_iframe_shim" src="' + l + '"' + ' tabIndex="-1"' + "></iframe>");
                    m.appendTo(g.getParent());
                }
                i.unselectable();
                j.unselectable();
                return {
                    element: f,
                    parts: {
                        dialog: f.getChild(0),
                        title: i,
                        close: j,
                        tabs: g.getChild(2),
                        contents: g.getChild([3, 0, 0, 0]),
                        footer: g.getChild([3, 0, 1, 0])
                    }
                };
            },
            destroy: function (a) {
                var b = a.container, c = a.element;
                if (b) {
                    b.clearCustomData();
                    b.remove();
                }
                if (c) {
                    c.clearCustomData();
                    1 == a.elementMode && c.show();
                    delete a.element;
                }
            }
        };
    }());
    a.editor.prototype.getThemeSpace = function (b) {
        var c = "cke_" + b, d = this._[c] || (this._[c] = a.document.getById(c + "_" + this.name));
        return d;
    };
    a.editor.prototype.resize = function (c, d, e, f) {
        var g = this;
        var h = g.container, i = a.document.getById("cke_contents_" + g.name), j = b.webkit && g.document && g.document.getWindow().$.frameElement, k = f ? h.getChild(1) : h;
        k.setSize("width", c, true);
        j && (j.style.width = "1%");
        var l = e ? 0 : (k.$.offsetHeight || 0) - (i.$.clientHeight || 0);
        i.setStyle("height", Math.max(d - l, 0) + "px");
        j && (j.style.width = "100%");
        g.fire("resize");
    };
    a.editor.prototype.getResizable = function (b) {
        return b ? a.document.getById("cke_contents_" + this.name) : this.container;
    };
}();