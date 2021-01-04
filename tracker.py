class IndexTracker(object):
    def __init__(self, ax, X, args_dict={}):
        self.ax = ax
        if args_dict.get("title") is not None:
            ax.set_title(args_dict.get("title"))
        else:
            ax.set_title('use scroll wheel to navigate images')

        self.X = X
        rows, cols, self.slices = X.shape
        self.ind = self.slices//2
        
        # Args dictionary, includes plot parameters
        # x,y limits saved in arg extent
        self.args_dict = args_dict
        
        self.im = ax.imshow(self.X[:, :, self.ind],
                           extent = self.args_dict.get("extent"))
        self.zvals = self.args_dict.get("zvals")
        self.zunit = self.args_dict.get("zunit")
        self.zstr = self.args_dict.get("zstr")
        self.zval = None
        if (self.zvals is not None):
            self.zval = self.zvals[self.ind]
        self.update()

    def onscroll(self, event):
        print("%s %s" % (event.button, event.step))
        if event.button == "up":
            self.ind = (self.ind + 1) % self.slices
        else:
            self.ind = (self.ind - 1) % self.slices
        self.update()

    def update(self):
        self.im.set_data(self.X[:, :, self.ind])
        # Set zval
        if self.zval is not None:
            self.zval = self.zvals[self.ind]
            self.ax.set_ylabel("%s = %.3f %s" % (self.zstr, self.zval, self.zunit))
        else:
            self.ax.set_ylabel("split %s" % (self.ind))
        self.im.axes.figure.canvas.draw()
