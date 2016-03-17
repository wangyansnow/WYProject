require('UIColor');
defineClass('WYBaseController', {
    viewDidLoad: function() {
    self.super().viewDidLoad();
    
    self.view().setBackgroundColor(UIColor.orangeColor());
    },
});

