---
title: unity加载图片、音乐及替换到指定组件上的总结
date: 2020-04-15 15:46:44
tags: [unity,方法,总结]
---
### 音乐
#### 读取
我这里是通过c#的object和unity的GameObject分别读取，然后贴在GameObject的组件的clip上，之后可以直接对组件调用Play()、Pause()、Stop()方法，和对loop之类的参数赋值。
代码：
```
    private string[] songList = {"fade_cut","Flirting_With_June_cut","lzttdmg_cut","Ocean_cut","Relax_cut"};
    private object objs;
    private GameObject GObject;

    public void LoadMusic(int num){
    	objs = Resources.Load(songList[num]);
    	GObject.GetComponent<AudioSource>().clip = (AudioClip)objs; 
    	GObject.GetComponent<AudioSource>().Play();
    	GObject.GetComponent<AudioSource>().loop = true;

    }

    void Start(){
        GObject = GameObject.Find("SelectionPage");
    }
```
可以提前加载的尽量方Start()里加载，示例中也可以提前加载成数组，但是考虑到内存资源的的占用使用的逐个加载。
以上使用了c#自带方法，提供了一种理解角度，更符合unity语法的方法如下：
#### 读取（unity风格）(主流方法）
代码：
```
private string[] songList = {"fade_cut","Flirting_With_June_cut","lzttdmg_cut","Ocean_cut","Relax_cut"};
    private AudioClip objs;
    private GameObject GObject;

    public void LoadMusic(int num){
    	objs = Resources.Load(songList[num], typeof(AudioClip)) as AudioClip;
    	GObject.GetComponent<AudioSource>().clip = objs;
    	GObject.GetComponent<AudioSource>().Play();
    	GObject.GetComponent<AudioSource>().loop = true;

    }
    void Start(){
        GObject = GameObject.Find("SelectionPage");
    }
```
使用
```
Resources.Load(路径, typeof(目标格式)) as 目标格式;
```
形式读取。
#### 更简洁的写法
```
private string[] songList = {"fade_cut","Flirting_With_June_cut","lzttdmg_cut","Ocean_cut","Relax_cut"};
    private AudioClip objs;
    private GameObject GObject;
    private AudioSource audioSource;

    public void LoadMusic(int num){
    	objs = Resources.Load(songList[num], typeof(AudioClip)) as AudioClip;
    	audioSource.clip = objs;
    	audioSource.Play();
    	audioSource.loop = true;

    }
    void Start()
    {
        GObject = GameObject.Find("SelectionPage");
        Debug.Log(GObject.GetComponent<AudioSource>()); // 查看要用变量指代的具体是什么类型
        audioSource = GObject.GetComponent<AudioSource>();

        LoadMusic(0); // 打开游戏就播放
    }
```
可以更进一步用变量替代重复的调用语句，如
```
GObject.GetComponent<AudioSource>()
```
![](1.1.png)
具体声明为什么格式，可以先打印看一下。
另外开场就进行的操作，如播放音乐，可以放在Start()里。

#### 注意
需要注意的是要播放音乐，必须先把音乐组件放在某个游戏体上，不能凭空播放音乐。

### 图片
#### 读取
读取系统自带的图像组件，必须使用
```
using UnityEngine.UI;
```
否则会找不到Image。

代码：
```
	private Image icon;
	public Sprite sp1,sp2;
	public void ChangeThePicture(){

		if(this.GetComponent<Scrollbar>().value < 0.5){
			
			icon.sprite = sp1;

		}else{
			icon.sprite = sp2;
		}		
	}
    // Start is called before the first frame update
    void Start()
    {
        icon = this.GetComponent<Image>();
        sp1 = Resources.Load("Pictures/SettingPage/矩形 3943 拷贝", typeof(Sprite)) as Sprite;
        sp2 = Resources.Load("Pictures/SettingPage/bg_kaiguan", typeof(Sprite)) as Sprite;
    }
```
### 总结
图片挂的是sprite，音乐挂的是clip，都不是检视窗口内左侧的对应名字。
出于节省资源的考虑，可以把sp1、sp2这种多次使用的图片在父物体里以public方式加载，在当前脚本里调用即可，不在当前脚本加载是为了保持脚本重复利用。
于是另一个结论，重复利用的脚本不加载资源。