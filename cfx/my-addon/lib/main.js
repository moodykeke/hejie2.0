var buttons = require('sdk/ui/button/action');
var tabs = require("sdk/tabs");
var self = require("sdk/self");
var audios = [],
    page;

var button = buttons.ActionButton({
  id: "mozilla-link",
  label: "Visit Mozilla",
  icon: {
    "16": "./icon-16.png",
    "32": "./icon-32.png",
    "64": "./icon-64.png"
  },
  onClick: handleClick //handleClick
});

function Audio(dom) {   // 每一个Audio的实例对应页面上的 一个 audio 标签, 负责其相应的逻辑
    this.dom = dom;
    this.initStatus = this.dom.paused;
}
Audio.prototype = {
    isPaused : function () {
        return this.dom.paused;
    },
    pause : function () {
        this.dom.pause();
    },
    backInit : function () {
        if (this.initStatus) {
            this.dom.parse();
        } else {
            this.dom.play();
        }
    }
};

function Page() {   // Page的实例负责一个html页面的一些逻辑
    this.audios = null; // Audio实例组成的数组
}
Page.prototype = {
    mute : function () {    // 静音
        this.audios.forEach(function (audio) {
            audio.pause();
        });
    },
    backInit : function () {    // 将所有 audio 恢复初始状态
        this.audios.forEach(function (audio) {
            audio.backInit();
        });
    },
    isPlaying : function () {   // 页面是否有音频在播放
        var bool = false;
        this.audios.forEach(function (audio) {
            if (!audio.isPaused()) {
                bool = true;
            }
        });
        return bool;
    }
};


function handleClick(state) {
    var worker = tabs.activeTab.attach({
        contentScriptFile: self.data.url("mute.js")
    });
    worker.port.emit("mute");
}

// PPS : 因为没找到 firefox 扩展关于音频的 API, 所以用HTML5音频的API来替代了, 不过和要求有点出入...  囧
