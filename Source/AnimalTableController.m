
#import "AnimalTableController.h"
#import "RainforestCardInfo.h"
#import "CardNode.h"
#import "CardCell.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>

static NSString *kCellReuseIdentifier = @"CellReuseIdentifier";

@interface AnimalTableController ()
@property (strong, nonatomic) ASTableNode *tableNode;
@property (strong, nonatomic) NSMutableArray<RainforestCardInfo *> *animals;
@end

@interface AnimalTableController (DataSource)<ASTableDataSource>
@end

@interface AnimalTableController (Delegate)<ASTableDelegate>
@end

@interface AnimalTableController (Helpers)
- (void)retrieveNextPageWithCompletion:(void (^)(NSArray *))block;
- (void)insertNewRowsInTableNode:(NSArray *)newAnimals;
@end

@implementation AnimalTableController

#pragma mark - Lifecycle

- (instancetype)initWithAnimals:(NSArray<RainforestCardInfo *> *)animals {
    _tableNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
  _animals = animals.mutableCopy;
  if (!(self = [super init])) { return nil; }
    [self wireDelegation];
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];

//  self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
//  [self.tableView registerClass:[CardCell class] forCellReuseIdentifier:kCellReuseIdentifier];

//  [self wireDelegation];
//  [self applyStyle];

//  [self.view addSubview:self.tableView];
    
    [self.view addSubnode:self.tableNode];
    [self applyStyle];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    //  self.tableView.frame = self.view.bounds;
    self.tableNode.frame = self.view.bounds;
}

#pragma mark - Delegation

- (void)wireDelegation {
  self.tableNode.dataSource = self;
  self.tableNode.delegate = self;
}

#pragma mark - Appearance

- (void)applyStyle {
  self.view.backgroundColor = [UIColor blackColor];
    self.tableNode.view.separatorStyle = UITableViewCellSeparatorStyleNone;
//  self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (BOOL)prefersStatusBarHidden {
  return YES;
}

@end


@implementation AnimalTableController (DataSource)

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//  return self.animals.count;
//}

- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return self.animals.count;
}

- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    RainforestCardInfo * animal = self.animals[indexPath.row];
    
    return ^{
        CardNode *cardNode = [[CardNode alloc] initWithAnimal:animal];
        return cardNode;
    };
}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//  CardCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier];
//
//  cell.backgroundColor = [UIColor lightGrayColor];
//  cell.animalInfo = self.animals[indexPath.row];
//
//  return cell;
//}

@end


@implementation AnimalTableController (Delegate)

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return self.view.bounds.size.height;
}

@end

@implementation AnimalTableController (Helpers)

- (void)retrieveNextPageWithCompletion:(void (^)(NSArray *))block {
//  NSArray *moreAnimals = [[NSArray alloc] initWithArray:[self.animals subarrayWithRange:NSMakeRange(0, 5)] copyItems:NO];
//  
//  // Important: this block must run on the main thread
//  dispatch_async(dispatch_get_main_queue(), ^{
//    block(moreAnimals);
//  });
}

- (void)insertNewRowsInTableNode:(NSArray *)newAnimals {
//  NSInteger section = 0;
//  NSMutableArray *indexPaths = [NSMutableArray array];
//  
//  NSUInteger newTotalNumberOfPhotos = self.animals.count + newAnimals.count;
//  for (NSUInteger row = self.animals.count; row < newTotalNumberOfPhotos; row++) {
//    NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:section];
//    [indexPaths addObject:path];
//  }
//  
//  [self.animals addObjectsFromArray:newAnimals];
//  [self.tableNode insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
}

@end
