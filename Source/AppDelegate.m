

#import "AppDelegate.h"
#import "AnimalTableController.h"
#import "RainforestCardInfo.h"
#import "AnimalPagerController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  [self installRootViewController];
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)installRootViewController {
  AnimalTableController *vc = [[AnimalTableController alloc] initWithAnimals:[RainforestCardInfo allAnimals]];
  self.window.rootViewController = vc;
}

@end
