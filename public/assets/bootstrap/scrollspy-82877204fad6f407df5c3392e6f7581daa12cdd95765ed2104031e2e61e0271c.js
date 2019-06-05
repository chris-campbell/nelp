function _classCallCheck(t,e){if(!(t instanceof e))throw new TypeError("Cannot call a class as a function")}var _typeof="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t},_createClass=function(){function t(t,e){for(var o=0;o<e.length;o++){var r=e[o];r.enumerable=r.enumerable||!1,r.configurable=!0,"value"in r&&(r.writable=!0),Object.defineProperty(t,r.key,r)}}return function(e,o,r){return o&&t(e.prototype,o),r&&t(e,r),e}}(),ScrollSpy=function(t){var e="scrollspy",o="4.0.0-alpha.6",r="bs.scrollspy",i="."+r,s=".data-api",n=t.fn[e],l={offset:10,method:"auto",target:""},a={offset:"number",method:"string",target:"(string|element)"},f={ACTIVATE:"activate"+i,SCROLL:"scroll"+i,LOAD_DATA_API:"load"+i+s},c={DROPDOWN_ITEM:"dropdown-item",DROPDOWN_MENU:"dropdown-menu",NAV_LINK:"nav-link",NAV:"nav",ACTIVE:"active"},h={DATA_SPY:'[data-spy="scroll"]',ACTIVE:".active",LIST_ITEM:".list-item",LI:"li",LI_DROPDOWN:"li.dropdown",NAV_LINKS:".nav-link",DROPDOWN:".dropdown",DROPDOWN_ITEMS:".dropdown-item",DROPDOWN_TOGGLE:".dropdown-toggle"},_={OFFSET:"offset",POSITION:"position"},u=function(){function s(e,o){var r=this;_classCallCheck(this,s),this._element=e,this._scrollElement="BODY"===e.tagName?window:e,this._config=this._getConfig(o),this._selector=this._config.target+" "+h.NAV_LINKS+","+this._config.target+" "+h.DROPDOWN_ITEMS,this._offsets=[],this._targets=[],this._activeTarget=null,this._scrollHeight=0,t(this._scrollElement).on(f.SCROLL,function(t){return r._process(t)}),this.refresh(),this._process()}return s.prototype.refresh=function(){var e=this,o=this._scrollElement!==this._scrollElement.window?_.POSITION:_.OFFSET,r="auto"===this._config.method?o:this._config.method,i=r===_.POSITION?this._getScrollTop():0;this._offsets=[],this._targets=[],this._scrollHeight=this._getScrollHeight(),t.makeArray(t(this._selector)).map(function(e){var o=void 0,s=Util.getSelectorFromElement(e);return s&&(o=t(s)[0]),o&&(o.offsetWidth||o.offsetHeight)?[t(o)[r]().top+i,s]:null}).filter(function(t){return t}).sort(function(t,e){return t[0]-e[0]}).forEach(function(t){e._offsets.push(t[0]),e._targets.push(t[1])})},s.prototype.dispose=function(){t.removeData(this._element,r),t(this._scrollElement).off(i),this._element=null,this._scrollElement=null,this._config=null,this._selector=null,this._offsets=null,this._targets=null,this._activeTarget=null,this._scrollHeight=null},s.prototype._getConfig=function(o){if("string"!=typeof(o=t.extend({},l,o)).target){var r=t(o.target).attr("id");r||(r=Util.getUID(e),t(o.target).attr("id",r)),o.target="#"+r}return Util.typeCheckConfig(e,o,a),o},s.prototype._getScrollTop=function(){return this._scrollElement===window?this._scrollElement.pageYOffset:this._scrollElement.scrollTop},s.prototype._getScrollHeight=function(){return this._scrollElement.scrollHeight||Math.max(document.body.scrollHeight,document.documentElement.scrollHeight)},s.prototype._getOffsetHeight=function(){return this._scrollElement===window?window.innerHeight:this._scrollElement.offsetHeight},s.prototype._process=function(){var t=this._getScrollTop()+this._config.offset,e=this._getScrollHeight(),o=this._config.offset+e-this._getOffsetHeight();if(this._scrollHeight!==e&&this.refresh(),t>=o){var r=this._targets[this._targets.length-1];this._activeTarget!==r&&this._activate(r)}else{if(this._activeTarget&&t<this._offsets[0]&&this._offsets[0]>0)return this._activeTarget=null,void this._clear();for(var i=this._offsets.length;i--;){this._activeTarget!==this._targets[i]&&t>=this._offsets[i]&&(this._offsets[i+1]===undefined||t<this._offsets[i+1])&&this._activate(this._targets[i])}}},s.prototype._activate=function(e){this._activeTarget=e,this._clear();var o=this._selector.split(",");o=o.map(function(t){return t+'[data-target="'+e+'"],'+t+'[href="'+e+'"]'});var r=t(o.join(","));r.hasClass(c.DROPDOWN_ITEM)?(r.closest(h.DROPDOWN).find(h.DROPDOWN_TOGGLE).addClass(c.ACTIVE),r.addClass(c.ACTIVE)):r.parents(h.LI).find("> "+h.NAV_LINKS).addClass(c.ACTIVE),t(this._scrollElement).trigger(f.ACTIVATE,{relatedTarget:e})},s.prototype._clear=function(){t(this._selector).filter(h.ACTIVE).removeClass(c.ACTIVE)},s._jQueryInterface=function(e){return this.each(function(){var o=t(this).data(r),i="object"===(void 0===e?"undefined":_typeof(e))&&e;if(o||(o=new s(this,i),t(this).data(r,o)),"string"==typeof e){if(o[e]===undefined)throw new Error('No method named "'+e+'"');o[e]()}})},_createClass(s,null,[{key:"VERSION",get:function(){return o}},{key:"Default",get:function(){return l}}]),s}();return t(window).on(f.LOAD_DATA_API,function(){for(var e=t.makeArray(t(h.DATA_SPY)),o=e.length;o--;){var r=t(e[o]);u._jQueryInterface.call(r,r.data())}}),t.fn[e]=u._jQueryInterface,t.fn[e].Constructor=u,t.fn[e].noConflict=function(){return t.fn[e]=n,u._jQueryInterface},u}(jQuery);