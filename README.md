# rotationiOS6Later

一个categroy搞定ios6及其以后版本，指定某个viewcontroller转屏问题


#使用

/*
 ********* 解决ios6及其以上的转屏问题
 
 使用方法：
 
 1、在将要设置转屏规则的viewController，展示时设置window的rootViewController 的 isShouldAutorotate 、 supportedOrientations 、 preferredOrientation 三个属性即可控制当前viewController屏幕转屏设置。

 2、在该viewController不显示的时候调用reset 方法，初始化转屏设置。
 
 
*/


 /*
  ******* sample *******
 
     - (void)viewDidAppear:(BOOL)animated
     {
        [super viewDidAppear:animated];
        [[UIWindow rooVC] setIsShouldAutorotate:YES supportedOrientations:UIInterfaceOrientationMaskAll preferredOrientation:UIInterfaceOrientationPortrait];
     
     }
     
     - (void)viewDidDisappear:(BOOL)animated
     {
        [super viewDidDisappear:animated];
        [[UIWindow rooVC] reset];
     }

 ******* sample *******
 */





#转屏 - 横竖屏处理简介

##转屏

	由于sdk的升级，转屏处理也发生这变化，分为两个阶段ios6之前，ios6 及其之后

### ios6之前采用的方法
	
	相关文章：
	<http://www.qianxuechao.cn/archives/4165>

			#pragma mark ios6 以下
			
			//在转屏的viewController中实现如下方法，来设置当前viewController支持那些转屏
			- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
			    if (interfaceOrientation==UIInterfaceOrientationLandscapeLeft) {
			        //zuo
			    }
			    if (interfaceOrientation==UIInterfaceOrientationLandscapeRight) {
			        //you
			    }
			    if (interfaceOrientation==UIInterfaceOrientationPortrait) {
			        //shang
			    }
			    if (interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown) {
			        //xia
			    }
			    return YES;
			}


### ios6 之后
	
	在window的rootViewController中实现如下方法
	
	(A++)<http://ningmengjiabing.blog.163.com/blog/static/20484719820130935520977/>
	
		// 是否支持屏幕旋转
		- (BOOL)shouldAutorotate {
		    return YES;
		}
		// 支持的旋转方向
		- (NSUInteger)supportedInterfaceOrientations {
		    return UIInterfaceOrientationMaskAllButUpsideDown;//UIInterfaceOrientationMaskAllButUpsideDown;
		}
		// 一开始的屏幕旋转方向
		- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
		    return UIInterfaceOrientationPortrait;
		}
		
		
##相关文章
 
 (A++)<http://www.th7.cn/Program/IOS/201312/164711.shtml>
	
 <http://ningmengjiabing.blog.163.com/blog/static/20484719820130935520977/>
## 实际应用

* **解决:iOS6下shouldAutorotateToInterfaceOrientation不起作用，屏幕旋转同时支持iOS5和iOS6**  

	<http://blog.163.com/l1_jun/blog/static/14386388201302294653607/> 
	
	(A-)<http://mobile.51cto.com/iphone-407786.htm>
	
	
* 手动旋转屏幕
	<http://blog.csdn.net/xuqiang918/article/details/14228179>
	
	通常在使用视图控制器时，状态栏的方向会自动改变。如果要强制状态栏朝向一个方向，可以用UIApplication类的setStatusBarOrientation方法：
	
	[ [UIApplication shareApplilcation] setStatusBarOrientation: UIInterfaceOrientationLandscapeRight  animated: NO ]; 

	
		在设备上有下列方向可以使用：
		UIDeviceOrientationPortrait 
		在竖屏模式，垂直向上
		
		UIDeviceOrientationPortraitUpsideDown 
		在竖屏模式，垂直方向上下颠倒
		
		UIDeviceOrientationLandscapeLeft 
		设备逆时针旋转到横屏模式
		
		UIDeviceOrientationLandscapeRight 
		设备顺时针旋转到横屏模式
		
		UIDeviceOrientationFaceUp 
		设备平放在类似桌子的平面上，正面向上
		
		UIDeviceOrientationFaceDown 
		设备平放在类似桌子的平面上，正面向下
	


 
