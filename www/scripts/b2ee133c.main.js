(function(){window.mmpApp={Models:{},Collections:{},Views:{},Routers:{},Helpers:{},Settings:{defaultUrl:"http://178.254.25.56"},init:function(){"use strict";var a,b,c;return nfc&&alert("I can haz NFC?"),c=Modernizr.history,Backbone.history.start({pushState:!1}),b=new this.Views.RootView,b.render(),a=new this.Helpers.EventHelper(this.Helpers.PusherEventHelper)}},$(function(){"use strict";return mmpApp.init()})}).call(this),this.JST=this.JST||{},this.JST["app/scripts/templates/product.ejs"]=function(obj){obj||(obj={});{var __t,__p="";_.escape}with(obj)__p+='<a href="" id="backLink" class="button rounded emphasized">&lsaquo;</a>\n\n<img src="http://178.254.25.56/'+(null==(__t=attributes.media.default_image)?"":__t)+'" class="article--image">\n\n<div class="article--content">\n  <strong class="article--main-tag">Kategorie</strong>\n  <h1 class="headline-h1">'+(null==(__t=attributes.product_data.name)?"":__t)+"</h1>\n  <p>"+(null==(__t=attributes.product_data.description)?"":__t)+'</p>\n\n  <div class="article--actions">\n    <div class="article--price">'+(null==(__t=attributes.product_data.price)?"":__t)+' €</div>\n    <div class="smaller">Versand per Auto möglich</div>\n    <div class="article--buttons">\n      <a href="#" id="addToCart" class="button primary full-width">In den Warenkorb</a>\n      <a href="#" id="fakeCheckout" class="button full-width">Fake Checkout</a>\n    </div>\n  </div>\n\n</div>\n';return __p},this.JST["app/scripts/templates/root.ejs"]=function(obj){obj||(obj={});{var __p="";_.escape}with(obj)__p+='<div id="rootView">\n  <a href="#" class="button primary" id="fakeInteraction">Tap here</a>\n</div>\n';return __p},function(){"use strict";var a,b={}.hasOwnProperty,c=function(a,c){function d(){this.constructor=a}for(var e in c)b.call(c,e)&&(a[e]=c[e]);return d.prototype=c.prototype,a.prototype=new d,a.__super__=c.prototype,a};mmpApp.Models.ProductModel=function(b){function d(){return a=d.__super__.constructor.apply(this,arguments)}return c(d,b),d.prototype.url=function(){var a;return a=this.id,""+mmpApp.Settings.defaultUrl+"/product/"+a+".json"},d.prototype.addToCart=function(a){var b;return b=this.attributes.product_data.id,$.get(""+mmpApp.Settings.defaultUrl+"/product/"+b+"/buy.json",function(b){return a(b)})},d.prototype.checkout=function(a){return $.get(""+mmpApp.Settings.defaultUrl+"/order.json",function(b){return a(b)})},d}(Backbone.Model)}.call(this),function(){"use strict";var a,b={}.hasOwnProperty,c=function(a,c){function d(){this.constructor=a}for(var e in c)b.call(c,e)&&(a[e]=c[e]);return d.prototype=c.prototype,a.prototype=new d,a.__super__=c.prototype,a};mmpApp.Routers.ApplicationRouter=function(b){function d(){return a=d.__super__.constructor.apply(this,arguments)}return c(d,b),d.prototype.routes={"":"rootRoute","product/:id":"showProduct"},d.prototype.rootRoute=function(){var a;return a=new mmpApp.Views.RootView,a.render()},d.prototype.showProduct=function(a){var b,c;return c=new mmpApp.Models.ProductModel({id:a}),b=c.fetch(),b.done(function(){var a;return a=new mmpApp.Views.ProductView({model:c}),a.render()})},d}(Backbone.Router)}.call(this),function(){"use strict";var a,b={}.hasOwnProperty,c=function(a,c){function d(){this.constructor=a}for(var e in c)b.call(c,e)&&(a[e]=c[e]);return d.prototype=c.prototype,a.prototype=new d,a.__super__=c.prototype,a};mmpApp.Views.ProductView=function(b){function d(){return a=d.__super__.constructor.apply(this,arguments)}return c(d,b),d.prototype.template=JST["app/scripts/templates/product.ejs"],d.prototype.el="#app-body",d.prototype.events={"click #addToCart":"addToCart","click #fakeCheckout":"fakeCheckout","click #backLink":"back"},d.prototype.render=function(){return navigator.notification&&navigator.notification.vibrate(400),this.$el.html(this.template(this.model))},d.prototype.addToCart=function(a){return a.preventDefault(),this.model.addToCart(function(){return alert("Product added to cart")})},d.prototype.fakeCheckout=function(a){return a.preventDefault(),this.model.checkout(function(){return alert("Checked out, check the backend for the order!")})},d.prototype.back=function(a){return a.preventDefault(),mmpApp.appRouter.navigate("/",{trigger:!0})},d}(Backbone.View)}.call(this),function(){"use strict";var a,b={}.hasOwnProperty,c=function(a,c){function d(){this.constructor=a}for(var e in c)b.call(c,e)&&(a[e]=c[e]);return d.prototype=c.prototype,a.prototype=new d,a.__super__=c.prototype,a};mmpApp.Views.RootView=function(b){function d(){return a=d.__super__.constructor.apply(this,arguments)}return c(d,b),d.prototype.template=JST["app/scripts/templates/root.ejs"],d.prototype.el="#app-body",d.prototype.events={"click #fakeInteraction":"showProduct"},d.prototype.render=function(){return this.$el.html(this.template())},d.prototype.showProduct=function(a){return a.preventDefault(),mmpApp.appRouter.navigate("product/chpmnd1",{trigger:!0})},d}(Backbone.View)}.call(this),function(){mmpApp.Helpers.EventHelper=function(){function a(a){this.adapter=new a,this.adapter.listen(this)}return a.prototype.showProduct=function(a){return mmpApp.appRouter.navigate("product/"+a,{trigger:!0})},a}()}.call(this),function(){mmpApp.Helpers.PusherEventHelper=function(){function a(){this.pusher=new Pusher("53fcdc31927d1aaf9cdd"),this.channel=this.pusher.subscribe("test_channel")}return a.prototype.listen=function(a){return this.channel.bind("showProduct",function(b){return a.showProduct(b.id)})},a}()}.call(this);