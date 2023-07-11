

#import "AnimalPagerController.h"
#import "AnimalTableController.h"
#import "RainforestCardInfo.h"
#import "CardNode.h"

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface AnimalPagerController ()
@property (strong, nonatomic) ASPagerNode *pagerNode;
@property (strong, nonatomic) NSArray<NSArray<RainforestCardInfo *> *> *animals;
@end

@interface AnimalPagerController (ASPagerDataSource)<ASPagerDataSource>
@end


@implementation AnimalPagerController

#pragma mark - Lifecycle

- (instancetype)init {
  if (!(self = [super init])) { return nil; }

  _animals = @[[RainforestCardInfo birdCards],
               [RainforestCardInfo mammalCards],
               [RainforestCardInfo reptileCards]];

  // Create and configure ASPagerNode instance here:

  _pagerNode.backgroundColor = [UIColor blackColor];

  return self;
}

- (void)viewWillLayoutSubviews {
  [super viewWillLayoutSubviews];
  self.pagerNode.frame = self.view.bounds;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  [self.view addSubnode:self.pagerNode];
}

#pragma mark - View Controller Appearance

- (BOOL)prefersStatusBarHidden {
  return YES;
}

@end


@implementation AnimalPagerController (ASPagerDataSource)

- (NSInteger)numberOfPagesInPagerNode:(ASPagerNode *)pagerNode {
  return 0;
}

@end
