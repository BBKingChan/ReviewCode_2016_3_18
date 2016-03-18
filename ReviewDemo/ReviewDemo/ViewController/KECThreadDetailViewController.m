//
//  KECDetailController.m
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/8/17.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import "KECThreadDetailViewController.h"
#import "SDImageCache.h"
#import "KECReplyBottomBar.h"
#import "SDWebImageDownloader.h"
#import "KECFourmManager.h"
#import "KECThreadDetail.h"
#import "KECThreadDetailCell.h"
#import "TFHpple.h"
#import "KECHomePost.h"
#import "KECShare.h"
#import "KECShareView.h"
#import "KECShareManager.h"
//#import "KECReplyViewController.h"
#import "KECNavigationController.h"
//#import "KECProfileViewController.h"
#import "GZQPageVC.h"
#import "KECThreadDetailHeaderView.h"
//#import "KECSelectDataTypeView.h"
//#import "KECColumnHomeViewController.h"
//#import "KECTopicDetailViewController.h"
//#import "KEGLoginViewController.h"

#define kPerPageCount 10
@interface KECThreadDetailViewController ()<UITableViewDelegate,UITableViewDataSource,KECReplyBottomBarDelegate,KECShareViewDelegate,KECThreadDetailCellDelegate,GZQPageVCDelegate,UIAlertViewDelegate,KECThreadDetailHeaderViewDelegate>
{
    SDImageCache        *_sdImageCache;
    NSMutableArray      *_loadingImageArr;
}
/**
 *  底部工具条
 */
@property (nonatomic, strong) KECReplyBottomBar *replyBottomBar;
/**
 *  顶部HeaderView
 */
@property (nonatomic, strong) KECThreadDetailHeaderView *headerView;
/**
 *  帖子所有数据
 */
@property (nonatomic, strong) NSMutableArray *postReplyFrameList;
/**
 *  所有cell的attributedString
 */
@property (nonatomic, strong) NSMutableArray *attributedStringArray;
/**
 *  所有cell的行高
 */
@property (nonatomic, strong) NSMutableArray *rowHeightArray;

/**
 *  所有要下载的 图片（包括表情）的url
 *  每一行cell要下载的图片数组，数组里再存放position：imageURL字典
 */
@property (nonatomic, strong) NSMutableArray *allImagesURLPositionDictArray;
/**
 *  所有 需要下载的图片的attatchment（待图片下载完成后替换掉占位图）
 *  每一行cell图片的数组，数组里再存放position：textAttachment字典
 */
@property (nonatomic, strong) NSMutableArray *allTextAttachmentPositionDictArray;
/**
 *  记录哪些indexPath里是有图片需要下载的，里面 元素 与allImagesURLPositionDictArray、allTextAttachmentPositionDictArray对应
 */
@property (nonatomic, strong) NSMutableArray *indexPathArray;
/**
 *  本地没有缓存需要去下载的imageURL
 */
@property (nonatomic, strong) NSMutableArray *toBeDownloadImageURLArray;
/**
 *  存放 indexPath：array，array存放position：bigImageURL
 */
@property (nonatomic, strong) NSMutableDictionary *allBigImagePositionDict;
/**
 *  当前页
 */
@property (nonatomic, assign) NSInteger page;
/**
 *  所有页面总数
 */
@property (nonatomic, assign) NSInteger pageCount;
/**
 *  原内容
 */
@property (nonatomic, strong) NSMutableArray *orgMessages;

@property (nonatomic, strong) SDWebImageDownloader *imageDownloader;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) KECShareView *shareView;

@property (nonatomic, assign) BOOL replySucceed;

@property (nonatomic, assign, getter=isToBeRefreshed) BOOL toBeRefreshed;

@property (nonatomic, strong) UIImageView *pageImageView;
@property (nonatomic, strong) GZQPageVC *pageVC;
@property (nonatomic, strong) UIView *coverView;

@property (nonatomic, copy)NSString * dataType;
//@property (nonatomic, strong)KECSelectDataTypeView * typeView;
@property (nonatomic, strong)UIButton * topButton;
@property (nonatomic, copy) NSString  *hostUid;
@property (nonatomic, copy) NSString  *hostName;

@property (nonatomic, copy) NSString  *subject;
@property (nonatomic, copy) NSString  *replyMsg;
@end

@implementation KECThreadDetailViewController

#pragma mark - Getter
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, APP_WIDTH, APP_HEIGHT) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = TableViewColor;
        
        __weak typeof(self) weakSelf = self;
//        [_tableView addLegendHeaderWithRefreshingBlock:^{
//            if (weakSelf.page != 1) {
//                weakSelf.page--;
//            }
//            [weakSelf.tableView.footer resetNoMoreData];
//            [weakSelf requestThreadDetailsDataWithPage:weakSelf.page isPull:YES];
//        }];
//        
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            if (weakSelf.page != 1) {
                weakSelf.page--;
            }
            [weakSelf.tableView.footer resetNoMoreData];
            [weakSelf requestThreadDetailsDataWithPage:weakSelf.page isPull:YES];
        }];
        
//        [_tableView addLegendFooterWithRefreshingBlock:^{
//            [weakSelf requestMoreThreadDetailsDataWithPage:weakSelf.page isPull:NO];
//        }];
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [weakSelf requestMoreThreadDetailsDataWithPage:weakSelf.page isPull:NO];
        }];
    }
    return _tableView;
}

- (NSMutableArray *)postReplyFrameList{
    if (!_postReplyFrameList) {
        _postReplyFrameList = [NSMutableArray array];
    }
    return _postReplyFrameList;
}

- (NSMutableArray *)attributedStringArray{
    if (!_attributedStringArray) {
        _attributedStringArray = [NSMutableArray array];
    }
    return _attributedStringArray;
}

- (NSMutableArray *)rowHeightArray
{
    if (!_rowHeightArray) {
        _rowHeightArray = [NSMutableArray array];
    }
    return _rowHeightArray;
}

- (NSMutableDictionary *)allBigImagePositionDict
{
    if (!_allBigImagePositionDict) {
        _allBigImagePositionDict = [NSMutableDictionary dictionary];
    }
    return _allBigImagePositionDict;
}

- (NSMutableArray *)allImagesURLPositionDictArray
{
    if (!_allImagesURLPositionDictArray) {
        _allImagesURLPositionDictArray = [NSMutableArray array];
    }
    return _allImagesURLPositionDictArray;
}

- (NSMutableArray *)allTextAttachmentPositionDictArray
{
    if (!_allTextAttachmentPositionDictArray) {
        _allTextAttachmentPositionDictArray = [NSMutableArray array];
    }
    return _allTextAttachmentPositionDictArray;
}

- (NSMutableArray *)indexPathArray
{
    if (!_indexPathArray) {
        _indexPathArray = [NSMutableArray array];
    }
    return _indexPathArray;
}

- (KECReplyBottomBar *)replyBottomBar{
    if (!_replyBottomBar) {
        _replyBottomBar = [[NSBundle mainBundle] loadNibNamed:@"KECReplyBottomBar" owner:nil options:nil][0];
        _replyBottomBar.frame = CGRectMake(0, 0, APP_WIDTH, 50);
        _replyBottomBar.delegate = self;
        _replyBottomBar.backgroundColor = TableViewBackgroundColor;
    }
    return _replyBottomBar;
}

- (NSMutableArray *)toBeDownloadImageURLArray
{
    if (!_toBeDownloadImageURLArray) {
        _toBeDownloadImageURLArray = [NSMutableArray array];
    }
    return _toBeDownloadImageURLArray;
}

- (KECShareView *)shareView{
    if (!_shareView) {
        _shareView = [[NSBundle mainBundle]loadNibNamed:@"KECShareView" owner:nil options:nil][0];
        _shareView.frame = CGRectMake(0, APP_HEIGHT, APP_WIDTH, APP_HEIGHT);
        _shareView.delegate = self;
        _shareView.hidden = YES;
    }
    return _shareView;
}

- (UIImageView *)pageImageView
{
    if (!_pageImageView) {
        UIImageView *pageImageView = [[UIImageView alloc] init];
        self.pageImageView = pageImageView;
        
        pageImageView.userInteractionEnabled = YES;
        pageImageView.image = [UIImage resizeImage:[UIImage imageNamed:@"detail_bg3"]];
        pageImageView.width = 100;
        pageImageView.height = kPageCellHeight * 7 + 10;
        pageImageView.x = APP_WIDTH - pageImageView.width - 10;
        //        if (self.navigationController.navigationBar.translucent) {
        //            pageImageView.y = self.bottomView.y - pageImageView.height;
        //
        //        }else {
        //            pageImageView.y = self.bottomView.y - pageImageView.height + 64;
        //        }
        pageImageView.y = APP_HEIGHT - 50 - pageImageView.height;
        
        [pageImageView addSubview:self.pageVC.view];
        self.pageVC.view.frame = CGRectMake(0, 0, pageImageView.width, pageImageView.height - 10);
        self.pageVC.view.alpha = 0.9;
    }
    return _pageImageView;
}

- (GZQPageVC *)pageVC
{
    if (!_pageVC) {
        GZQPageVC *pageVC = [[GZQPageVC alloc] init];
        _pageVC = pageVC;
        pageVC.delegate = self;
    }
    return _pageVC;
}

- (UIView *)coverView
{
    if (!_coverView) {
        UIView *coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, APP_WIDTH, APP_HEIGHT)];
        _coverView = coverView;
        _coverView.backgroundColor = [UIColor clearColor];
        
        UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapCoverView:)];
        [coverView addGestureRecognizer:tapGest];
    }
    return _coverView;
}

- (KECThreadDetailHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[NSBundle mainBundle] loadNibNamed:@"KECThreadDetailHeaderView" owner:nil options:nil][0];
        _headerView.delegate = self;
        _headerView.threadDetail = self.threadDetail;
    }
    return _headerView;
}

//- (KECSelectDataTypeView *)typeView{
//    
//    if (!_typeView) {
//        _typeView = [[NSBundle mainBundle]loadNibNamed:@"KECSelectDataTypeView" owner:nil options:nil][0];
//        _typeView.frame = CGRectMake(0,0,APP_WIDTH,APP_HEIGHT);
//        _typeView.hidden = YES;
//        _typeView.delegate = self;
//    }
//    return _typeView;
//    
//}

- (NSMutableArray *)orgMessages {
    if (!_orgMessages) {
        _orgMessages = [NSMutableArray array];
    }
    return _orgMessages;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataType = @"all";
    
    self.headerView.titleLabel.text = self.topTitle;;
    
    [self.view addSubview:self.tableView];
    
    [self setupHeaderView];
    
    [self setupBottomView];
    
    [self requestThreadDetailsDataWithPage:1 isPull:YES];
    
    _loadingImageArr = [NSMutableArray array];
    
    _sdImageCache = [SDImageCache sharedImageCache];
    
    self.imageDownloader = [SDWebImageDownloader sharedDownloader];
    self.imageDownloader.shouldDecompressImages = NO;
    self.imageDownloader.maxConcurrentDownloads = 2;
    
    self.title = @"全部";
    
    self.headerView.threadDetail = self.threadDetail;
    
//    [self.view addSubview:self.typeView];
    [self reSetTitleBarView];
    
    
    
    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;
    [mainWindow addSubview:self.shareView];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(replySuccee:) name:KECBackToPostNotification object:nil];
    
    self.navigationItem.leftBarButtonItems = [UIBarButtonItem barButtonItemsWithImage:[UIImage imageNamed:@"icon_back"] highImage:[UIImage imageNamed:@"icon_backon"] target:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"friend_moreicon"] style:UIBarButtonItemStylePlain target:self action:@selector(moreButtonClicked)];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // 回复成功
    if (self.replySucceed) {
        [self requestThreadDetailsDataWithPage:self.page isPull:NO];
        
    }
}

- (void)setupHeaderView{
    
    self.tableView.tableHeaderView = self.headerView;
}

- (void)setupBottomView{
    //    [self.view addSubview:self.replyBottomBar];
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, APP_HEIGHT - 50 , APP_WIDTH, 50)];
    [self.view addSubview:bottomView];
    
    [bottomView addSubview:self.replyBottomBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSInteger count = 1;
    if (self.postReplyFrameList.count) {
        count = self.postReplyFrameList.count;
    }
    
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.postReplyFrameList.count) {
        KECThreadDetailFrame *postReplyFrame = self.postReplyFrameList[indexPath.row];
        KECThreadDetailCell *cell = [KECThreadDetailCell postDetailCellWithTableView:tableView];
        cell.actionDelegate = self;
        cell.threadDetailFrame = postReplyFrame;
//        if(indexPath.row == 3){
//            KECThreadDetail *t = cell.threadDetailFrame.threadDetail;
//            KECLog(@"thr = %@", cell.threadDetailFrame.threadDetail);
//        }
        if (indexPath.row == 0) {
            cell.likeButton.hidden = YES;
            cell.shareButton.hidden = YES;
        }else{
            cell.likeButton.hidden = NO;
            cell.shareButton.hidden = NO;
        }
        
        [self presentCell:cell forIndexPath:indexPath];
        return cell;
    }
    
    return [UITableViewCell new];
}

- (void)presentCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath
{
    KECThreadDetailCell *postDetailCell = (KECThreadDetailCell *)cell;
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    [postDetailCell.contentTextView addGestureRecognizer:tapGR];
    
    NSAttributedString *attrStr = self.attributedStringArray[indexPath.row];
    NSString *str = attrStr.string;
    //                             GZQLog(@"str:%@", str);
    //        dispatch_async(dispatch_get_global_queue(0, 0), ^{
    
    //            dispatch_async(dispatch_get_main_queue(), ^{
    postDetailCell.contentTextView.replyRowNum = 0;
    [attrStr enumerateAttribute:@"isReply"
                        inRange:NSMakeRange(0, attrStr.length)
                        options:0
                     usingBlock:^(id value, NSRange range, BOOL *stop) {
                         //                         GZQLog(@"value:%@---range:(%ld, %ld)", value, range.location, range.length);
                         NSString *isReply = (NSString *)value;
                         if([isReply isEqualToString:@"YES"]) {
                             NSString *content = [str substringWithRange:range];
                             //                             GZQLog(@"content:%@", content);
                             CGSize constraint = CGSizeMake(APP_WIDTH - 16, CGFLOAT_MAX);
                             CGSize size = [content sizeWith:constraint fontSize:15];
                             //                             GZQLog(@"size:%@", NSStringFromCGSize(size));
                             NSInteger row = ceil(size.height / 20); //算出要加灰色背景的行数
                             
                             if ([content hasPrefix:@"\n"] || [content hasSuffix:@"\n"]) {
                                 row--;
                             }
                             //                             GZQLog(@"row:%ld", row);
                             postDetailCell.contentTextView.replyRowNum += row;
                         }
                     }];
    
    postDetailCell.contentTextView.attributedText = attrStr;
    [postDetailCell.contentTextView setNeedsDisplay];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
        if (indexPath.row == 0) {
            // 刚进来tableview时，2秒钟之后再开始下载图片，以免造成一进入界面卡顿
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self downloadImageOfIndexPath:indexPath];
            });
    
        }else {
            [self downloadImageOfIndexPath:indexPath];
        }
}

- (void)downloadImageOfIndexPath:(NSIndexPath *)indexPath
{
    if (![self.indexPathArray containsObject:indexPath]) {
        return;
    }
    NSInteger index = [self.indexPathArray indexOfObject:indexPath];
    NSMutableArray *currentIndexPathTextAttachmentPositionDictArray = self.allTextAttachmentPositionDictArray[index];
    KECLog(@"currentDownload:%ld", self.imageDownloader.currentDownloadCount);
    NSMutableArray *currentIndexPathImageURLPositionDictArray = self.allImagesURLPositionDictArray[index];
    
    [currentIndexPathImageURLPositionDictArray enumerateObjectsUsingBlock:^(NSDictionary *imageURLPositionDict, NSUInteger idx, BOOL *stop) {
        NSDictionary *textAttachmentPositionDict = currentIndexPathTextAttachmentPositionDictArray[idx];
        
        // 这个dict中只有一个元素
        [imageURLPositionDict enumerateKeysAndObjectsUsingBlock:^(NSNumber *position, NSString *imageURL, BOOL *stop) {
            // 假如self.toBeDownloadImageURLArray数组中不包含该imageURL则不需要下载
            if (![self.toBeDownloadImageURLArray containsObject:imageURL]) {
                return;
            }
            
            if(![_loadingImageArr containsObject:imageURL]){
                
                [_loadingImageArr addObject:imageURL];
                NSRange range = [imageURL rangeOfString:@"static/image/smiley"];
                NSString *img = imageURL;
                if (range.length) {
                    img = [NSString stringWithFormat:@"http://bbs.61learn.com/%@",imageURL];
                }
                
                [self.imageDownloader downloadImageWithURL:[NSURL URLWithString:img] options:SDWebImageDownloaderIgnoreCachedResponse | SDWebImageDownloaderLowPriority progress:nil completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
                    if(image)
                    {
                        KECLog(@"downlaodComplete--currentThread:%@", [NSThread currentThread]);
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [self.toBeDownloadImageURLArray removeObject:imageURL];
                            [_loadingImageArr removeObject:imageURL];
                            [_sdImageCache storeImage:image forKey:imageURL];
                            [currentIndexPathImageURLPositionDictArray removeObject:imageURLPositionDict];
                            
                            NSTextAttachment *textAttachment = textAttachmentPositionDict[position];
                            textAttachment.image = image;
                            NSRange range = [imageURL rangeOfString:@"static/image/smiley"];
                            if(range.length) //表情
                            {
                                textAttachment.bounds = CGRectMake(0, 0, 30, 30);
                                
                            }else {
                                CGFloat imageWidth = APP_WIDTH - 16;
                                CGFloat imageHeight = imageWidth * textAttachment.image.size.height / textAttachment.image.size.width;
                                textAttachment.bounds = CGRectMake(0, 0, imageWidth, imageHeight);
                            }
                            // 图片下载完成，重新计算cell高度（数据源为改变时才重新计算）
                            if ([self.allImagesURLPositionDictArray containsObject:currentIndexPathImageURLPositionDictArray]) {
                                CGFloat newRowHeight = [self heightOfRowAtIndex:indexPath.row];
                                
//                                if (indexPath.row == 0) {
//                                    newRowHeight += 100;
//                                }
                                
                                [self.rowHeightArray replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithDouble:newRowHeight]];
                                
                                // tableview不滚动时才刷新表格
                                if (![self.tableView isDragging] && ![self.tableView isDecelerating]) {
                                    if (currentIndexPathImageURLPositionDictArray.count == 0) { // 减少刷新次数，以防卡顿闪退
                                        
                                        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
                                    }
                                    
                                }else {
                                    self.toBeRefreshed = YES;
                                }
                            }
                        });
                    }
                }];
            }
        }];
    }];
}

- (CGFloat)heightOfRowAtIndex:(NSInteger)index
{
    static NSTextStorage *textStorage;
    static NSTextContainer *textContainer;
    static NSLayoutManager *layoutManager;;
    static CGFloat contentWidth;
    static dispatch_once_t oncePredicate;
    
    __weak typeof(self) wSelf = self;
    dispatch_once(&oncePredicate, ^{
        contentWidth = wSelf.view.width - 16;
        textStorage = [[NSTextStorage alloc] init];
        layoutManager = [[NSLayoutManager alloc] init];
        [textStorage addLayoutManager:layoutManager];
        textContainer = [[NSTextContainer alloc] initWithSize:CGSizeMake(contentWidth, FLT_MAX)];
        textContainer.lineFragmentPadding = 0;
        [layoutManager addTextContainer:textContainer];
    });
    
    NSAttributedString *attrStr = self.attributedStringArray[index];
    
    [textStorage setAttributedString:attrStr];
    [layoutManager ensureLayoutForTextContainer:textContainer];
    CGRect frame = [layoutManager usedRectForTextContainer:textContainer];
    KECLog(@"layoutManagerFrame:%@", NSStringFromCGRect(frame));
    
    return frame.size.height + 160;
}

// 停止滚动时，刷新当前可见cell数据
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (self.toBeRefreshed) {
        NSMutableArray *arrayM = [NSMutableArray array];
        for (UITableViewCell *cell in self.tableView.visibleCells) {
            NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
            [arrayM addObject:indexPath];
        }
        [self.tableView reloadRowsAtIndexPaths:arrayM withRowAnimation:UITableViewRowAnimationNone];
        self.toBeRefreshed = NO;
    }
    
    // 更改 翻页按钮 页数
    [self.replyBottomBar.pageButton setTitle:[NSString stringWithFormat:@"%ld/%ld", self.page, self.pageCount] forState:UIControlStateNormal];
    self.pageVC.currentPage = self.page;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.postReplyFrameList.count) {
        return [self.rowHeightArray[indexPath.row] doubleValue];
    }
    return APP_HEIGHT;
}

//设置刷新控件
- (void)setupRefreshController{
    //下拉
//    [self.tableView addLegendHeaderWithRefreshingTarget:self refreshingAction:@selector(requestThreadDetailsDataWithPage:isPull:)];
//    
//    [self.tableView addLegendFooterWithRefreshingTarget:self refreshingAction:@selector(requestThreadDetailsDataWithPage:isPull:)];
}

- (void)getDetailDataIsFirstTimeLoad:(BOOL)isFirstTimeLoad withPage:(NSInteger)page isPullUp:(BOOL)isPullUp isPullDown:(BOOL)isPullDown{
    if (isFirstTimeLoad) {
        //        [GZQLoadingView showLoadingViewToView:self.view];
    }
}

//请求首页数据
- (void)requestThreadDetailsDataWithPage:(NSInteger)page isPull:(BOOL)isPull{
    if (isPull) {
        self.page = 1;
    }
    
    NSString *uid = [KECDataManager dataManagerObjectForKey:USER_ID];
    NSString *token = [KECDataManager dataManagerObjectForKey:USER_TOKEN];
    NSString *fid = self.threadDetail.fid;
    NSString *tid = self.tid;
    NSString *sort = self.dataType;
//    NSDictionary *param=@{@"uid":uid,
//                          @"token":token,
//                          @"fid":fid,
//                          @"tid":tid,
//                          @"sort":sort,
//                          @"page":@(self.page)};
    NSDictionary *param=@{@"uid":@"11819",
                          @"token":@"f7fb0152983c939dbe8c4bd2f444c2a8",
                          @"fid":@"127",
                          @"tid":@"40141",
                          @"sort":sort,
                          @"page":@(self.page)};
    
    [KECFourmManager threadDetailWithParameters:param onCompletion:^(id responseObj) {
        [KECLoadingView hideLoadingViewToView:self.tableView];
        [self.tableView.header endRefreshing];

        NSInteger code = [responseObj[@"res"][@"code"] integerValue];
        if (code == 1) {
            NSArray *postlist = responseObj[@"inf"][@"postlist"];
            NSNumber *ispraise = responseObj[@"inf"][@"thread"][@"ispraise"];
            NSArray *newThreadDetails = [KECThreadDetail objectArrayWithKeyValuesArray:postlist];
            if (newThreadDetails.count < 10) {
                [self.tableView.footer noticeNoMoreData];
            }
            KECThreadDetail *hostThreadDetail = newThreadDetails[0];
            self.hostUid = hostThreadDetail.uid;
            self.hostName = hostThreadDetail.username;
            self.homePost.message = hostThreadDetail.message;
            self.subject = hostThreadDetail.subject;
            self.replyMsg = hostThreadDetail.message;
            
            NSMutableArray *arrayM = [NSMutableArray array];
            NSMutableArray *orgM = [NSMutableArray array];
            for (KECThreadDetail *threadDetail in newThreadDetails) {
                // 把message处理成html
                threadDetail.ispraise = ispraise;
                [orgM addObject:threadDetail.message];
                threadDetail.message = [NSString dealWithHTML:threadDetail.message];
                KECLog(@"look - %@",threadDetail.message);
                threadDetail.message = threadDetail.message;
                KECThreadDetailFrame *postRepllyFrame = [[KECThreadDetailFrame alloc] init];
                postRepllyFrame.threadDetail = threadDetail;
                [arrayM addObject:postRepllyFrame];
            }
            self.orgMessages = orgM;
            self.postReplyFrameList = arrayM;
            
            [self.attributedStringArray removeAllObjects];
            [self.allImagesURLPositionDictArray removeAllObjects];
            [self.allTextAttachmentPositionDictArray removeAllObjects];
            [self.allBigImagePositionDict removeAllObjects];
            [self.indexPathArray removeAllObjects];
            
            NSInteger currentCount = self.postReplyFrameList.count;
            for (NSInteger i = 0; i < currentCount; i++) {
                KECThreadDetailFrame *threadDetailFrame = self.postReplyFrameList[i];
                KECThreadDetail *threadDetail = threadDetailFrame.threadDetail;
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
                NSString *htmlString = [NSString dealWithHTML:threadDetail.message];
                
                NSData *data = [htmlString dataUsingEncoding:NSUTF8StringEncoding];
                TFHpple *doc = [[TFHpple alloc] initWithHTMLData:data];
                NSArray *elements = [doc searchWithXPathQuery:@"//body"];
                TFHppleElement * element = [elements objectAtIndex:0];
                NSArray *childs = element.children;
                NSAttributedString *attrStr = [self getAttrStringWith:childs indexPath:indexPath isReply:NO];
                
                [self.attributedStringArray addObject:attrStr];
            }
            
            // 计算每一行高度并且保存起来
            [self.rowHeightArray removeAllObjects];
            NSInteger attrStrCount = self.postReplyFrameList.count;
            
            for (NSInteger i = 0; i < attrStrCount; i++) {
                CGFloat rowHeight = [self heightOfRowAtIndex:i];
//                if (i == 0 ) {
//                    rowHeight += 100;
//                }
                [self.rowHeightArray addObject:[NSNumber numberWithDouble:rowHeight]];
            }
            
            
            // 更改 翻页按钮 页数
            NSNumber *replys = responseObj[@"inf"][@"thread"][@"replies"];
            NSInteger allPageCount = [replys integerValue] / kPerPageCount;
            if ([replys integerValue] % kPerPageCount) {
                allPageCount += 1;
            }
            self.pageCount = allPageCount;
            self.pageVC.pageNumber = allPageCount;
            
            [self.replyBottomBar.pageButton setTitle:[NSString stringWithFormat:@"%ld/%ld",(long)page, (long)self.pageCount] forState:UIControlStateNormal];
            self.pageVC.currentPage = page;
            
            [self.tableView reloadData];
            self.tableView.scrollsToTop = YES;
            
            // 当回复成功时
            if (self.replySucceed) {
                [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.postReplyFrameList.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:NO];
                self.replySucceed = NO;
            }
        }else{
            NSString *msg = responseObj[@"res"][@"msg"];
        }
        
        KECLog(@"resObj - %@",responseObj);
    } onError:^(NSError *error) {
        [self.tableView.header endRefreshing];
        KECLog(@"err - %@",error.description);
    }];
    
}

- (void)requestMoreThreadDetailsDataWithPage:(NSInteger)page isPull:(BOOL)isPull{
    self.page++;
    
    NSString *uid = [KECDataManager dataManagerObjectForKey:USER_ID];
    NSString *token = [KECDataManager dataManagerObjectForKey:USER_TOKEN];
    NSString *fid = self.threadDetail.fid;
    NSString *tid = self.tid;
    NSString *sort = self.dataType;
//    NSDictionary *param=@{@"uid":uid,
//                          @"token":token,
//                          @"fid":fid,
//                          @"tid":tid,
//                          @"sort":sort,
//                          @"page":@(self.page)};

    NSDictionary *param=@{@"uid":@"11819",
                          @"token":@"f7fb0152983c939dbe8c4bd2f444c2a8",
                          @"fid":@"127",
                          @"tid":@"40414",
                          @"sort":sort,
                          @"page":@(self.page)};
    
    [KECFourmManager threadDetailWithParameters:param onCompletion:^(id responseObj) {
        [KECLoadingView hideLoadingViewToView:self.tableView];
        [self.tableView.footer endRefreshing];
        
        NSInteger code = [responseObj[@"res"][@"code"] integerValue];
        if (code == 1) {
            
            NSArray *postlist = responseObj[@"inf"][@"postlist"];
            NSArray *newThreadDetails= [KECThreadDetail objectArrayWithKeyValuesArray:postlist];
            if (newThreadDetails.count < 10) {
                [self.tableView.footer noticeNoMoreData];
//                return ;
            }

            NSMutableArray *arrayM = [NSMutableArray array];
            NSMutableArray *orgM = [NSMutableArray array];
            for (KECThreadDetail *threadDetail in newThreadDetails) {
                // 把message处理成html
                [orgM addObject:threadDetail.message];
                threadDetail.message = [NSString dealWithHTML:threadDetail.message];
                KECLog(@"look - %@",threadDetail.message);
                threadDetail.message = threadDetail.message;
                KECThreadDetailFrame *postRepllyFrame = [[KECThreadDetailFrame alloc] init];
                postRepllyFrame.threadDetail = threadDetail;
                [arrayM addObject:postRepllyFrame];
            }
            //            NSMutableArray *arr =[NSMutableArray arrayWithArray:newThreadDetails];
            [self.orgMessages addObjectsFromArray:orgM];
            [self.postReplyFrameList addObjectsFromArray: arrayM];
            
            [self.attributedStringArray removeAllObjects];
            [self.allImagesURLPositionDictArray removeAllObjects];
            [self.allTextAttachmentPositionDictArray removeAllObjects];
            [self.allBigImagePositionDict removeAllObjects];
            [self.indexPathArray removeAllObjects];
            
            NSInteger currentCount = self.postReplyFrameList.count;
            for (NSInteger i = 0; i < currentCount; i++) {
                KECThreadDetailFrame *threadDetailFrame = self.postReplyFrameList[i];
                KECThreadDetail *threadDetail = threadDetailFrame.threadDetail;
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
                NSString *htmlString = [NSString dealWithHTML:threadDetail.message];
                
                NSData *data = [htmlString dataUsingEncoding:NSUTF8StringEncoding];
                TFHpple *doc = [[TFHpple alloc] initWithHTMLData:data];
                NSArray *elements = [doc searchWithXPathQuery:@"//body"];
                TFHppleElement * element = [elements objectAtIndex:0];
                NSArray *childs = element.children;
                NSAttributedString *attrStr = [self getAttrStringWith:childs indexPath:indexPath isReply:NO];
                
                [self.attributedStringArray addObject:attrStr];
            }
            
            // 计算每一行高度并且保存起来
            [self.rowHeightArray removeAllObjects];
            NSInteger attrStrCount = self.postReplyFrameList.count;
            
            for (NSInteger i = 0; i < attrStrCount; i++) {
                CGFloat rowHeight = [self heightOfRowAtIndex:i];
                //                if (i == 0 ) {
                //                    rowHeight += 100;
                //                }
                [self.rowHeightArray addObject:[NSNumber numberWithDouble:rowHeight]];
            }
            
            // 更改 翻页按钮 页数
            NSNumber *replys = responseObj[@"inf"][@"thread"][@"replies"];
            NSInteger allPageCount = [replys integerValue] / kPerPageCount;
            if ([replys integerValue] % kPerPageCount) {
                allPageCount += 1;
            }
            self.pageCount = allPageCount;
            self.pageVC.pageNumber = allPageCount;
            
            [self.replyBottomBar.pageButton setTitle:[NSString stringWithFormat:@"%ld/%ld",(long)page, (long)self.pageCount] forState:UIControlStateNormal];
            self.pageVC.currentPage = page;
            
            [self.tableView reloadData];
            
            // 最后一页时 隐藏上拉加载更多
            if (page == self.pageCount) {
                [self.tableView.footer noticeNoMoreData];
            }
            
            // 当回复成功时
            if (self.replySucceed) {
                [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.postReplyFrameList.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:NO];
                self.replySucceed = NO;
            }
        }else{
            NSString *msg = responseObj[@"res"][@"msg"];
        }
        
        KECLog(@"resObj - %@",responseObj);
    } onError:^(NSError *error) {
        [self.tableView.header endRefreshing];
        [self.tableView.footer endRefreshing];
        KECLog(@"err - %@",error.description);
    }];
    
}


#pragma mark - 处理AttrString
- (NSAttributedString *)getAttrStringWith:(NSArray *)elements indexPath:(NSIndexPath *)indexPath isReply:(BOOL)isReply
{
    //    __weak GZQPostDetailViewController *wSelf = self;
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] init];
    //    [self.imageArr removeAllObjects];
    for(TFHppleElement *childElement in elements)
    {
        NSString *name = childElement.tagName;
        KECLog(@"tagName:%@", name);
        
        if([name isEqualToString:@"text"])
        {
            
            NSString *content = childElement.content;
            if (!content.length) {
                content = [NSString filterDetail:childElement.raw];
            }
            
            KECLog(@"raw:%@-content:%@-tagName:%@-text:%@", childElement.raw, childElement.content, childElement.tagName, childElement.text);
            NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:content attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:isReply ? 15 : 16], NSForegroundColorAttributeName : (isReply ? RGB(156, 156, 156): RGB(51, 51, 51)), NSBaselineOffsetAttributeName : (isReply ? @7 : @7),  @"isReply" : (isReply ? @"YES" : @"NO")}];
            
            // 假如content里包含有url地址，需要处理成链接
            NSArray *ranges = [self rangesOfUrlInString:content];
            for (NSValue *rangeValue in ranges) {
                NSRange range = [rangeValue rangeValue];
                [str addAttributes:@{NSForegroundColorAttributeName : RGB(59, 187, 238), NSFontAttributeName : [UIFont systemFontOfSize:15], NSUnderlineStyleAttributeName : @1, @"TAG" : @(YES), @"URL" : [content substringWithRange:range], NSBaselineOffsetAttributeName : @7} range:range];
            }
            
            [attrStr appendAttributedString:str];
            
        }else if([name isEqualToString:@"img"]){
            NSDictionary *attributeDic = childElement.attributes;
            NSString *imgUrl = attributeDic[@"src"];
            
            NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
            
            // 当前图片在attributedString中的位置
            NSInteger position = attrStr.length;
            KECLog(@"imgURL:%@", imgUrl);
            
            if(!textAttachment.image){
                textAttachment.image = [UIImage imageNamed:@"default"];
                UIImage *cacheImage = [_sdImageCache imageFromDiskCacheForKey:imgUrl];
                if([imgUrl hasPrefix:@"static/image/smiley/emoji"]) { // 本地表情
                    cacheImage = [UIImage imageNamed:imgUrl];
                    
                }else {
                    // 记录哪个indexPath的cell需要下载图片
                    if (![self.indexPathArray containsObject:indexPath]) {
                        [self.indexPathArray addObject:indexPath];
                    }
                    
                    // 保存所有需要下载的图片表情的imageURL
                    NSMutableArray *currentIndexPathImagesURLPositionDictArray = nil;
                    if (self.allImagesURLPositionDictArray.count < self.indexPathArray.count) {
                        currentIndexPathImagesURLPositionDictArray = [NSMutableArray array];
                        [self.allImagesURLPositionDictArray addObject:currentIndexPathImagesURLPositionDictArray];
                    }else {
                        currentIndexPathImagesURLPositionDictArray = self.allImagesURLPositionDictArray[self.allImagesURLPositionDictArray.count - 1];
                    }
                    
                    NSDictionary *imageURLPositionDict = @{[NSNumber numberWithInteger:position] : imgUrl};
                    [currentIndexPathImagesURLPositionDictArray addObject:imageURLPositionDict];
                    
                    // 同时记录该textAttachment在attrStr中的位置，待图片下载完成后替换掉占位图
                    NSMutableArray *currentIndexPathTextAttachmentPositionDictArray = nil;
                    if (self.allTextAttachmentPositionDictArray.count < self.indexPathArray.count) {
                        currentIndexPathTextAttachmentPositionDictArray = [NSMutableArray array];
                        [self.allTextAttachmentPositionDictArray addObject:currentIndexPathTextAttachmentPositionDictArray];
                    }else {
                        currentIndexPathTextAttachmentPositionDictArray = self.allTextAttachmentPositionDictArray[self.allTextAttachmentPositionDictArray.count - 1];
                    }
                    NSDictionary *textAttachmentPositionDict = @{[NSNumber numberWithInteger:position] : textAttachment};
                    [currentIndexPathTextAttachmentPositionDictArray addObject:textAttachmentPositionDict];
                }
                
                if(cacheImage) {
                    textAttachment.image = cacheImage;
                }else {
                    // 这里记录 本地缓存未取到，需要下载 的图片信息
                    [self.toBeDownloadImageURLArray addObject:imgUrl];
                }
            }
            KECLog(@"imgUrl - %@",imgUrl);
            NSRange range = [imgUrl rangeOfString:@"static/image/smiley"];
            if(range.length) //30为表情的宽高
            {
                textAttachment.bounds = CGRectMake(0, 0, 30, 30);
                NSAttributedString *str = [NSAttributedString attributedStringWithAttachment:textAttachment];
                NSMutableAttributedString *mstr = [str mutableCopy];
                [mstr addAttributes:@{NSBaselineOffsetAttributeName : @7} range:NSMakeRange(0, 1)];
                
                [attrStr appendAttributedString:mstr];
                
            }else { // 大图
                // 保存大图，到时候根据大图数量分割cell
                NSMutableArray *currentIndexPathBigImageURLPositionDictArray = self.allBigImagePositionDict[indexPath];
                if (!currentIndexPathBigImageURLPositionDictArray) {
                    currentIndexPathBigImageURLPositionDictArray = [NSMutableArray array];
                    [self.allBigImagePositionDict setObject:currentIndexPathBigImageURLPositionDictArray forKey:indexPath];
                }
                NSDictionary *bigImageURLPositionDict = @{[NSNumber numberWithInteger:position] : imgUrl};
                [currentIndexPathBigImageURLPositionDictArray addObject:bigImageURLPositionDict];
                
                //                CGFloat imageWidth = IMG_WIDTH;
                CGFloat imageWidth = APP_WIDTH - 16;
                CGFloat imageHeight = imageWidth * textAttachment.image.size.height / textAttachment.image.size.width;
                textAttachment.bounds = CGRectMake(0, 0, imageWidth, imageHeight);
                
                KECLog(@"imgUrl - %@",imgUrl);
                NSAttributedString *str = [NSAttributedString attributedStringWithAttachment:textAttachment];
                NSMutableAttributedString *mstr = [str mutableCopy];
                [mstr addAttributes:@{@"IMAGE" : @(YES), @"URL" : imgUrl, NSBaselineOffsetAttributeName : @10} range:NSMakeRange(0, 1)];
                
                [attrStr appendAttributedString:mstr];
            }
            
        }else if([name isEqualToString:@"br"]) //换行
        {
            NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"\n"];
            
            if(![attrStr.string hasSuffix:@"\n"])
                [attrStr appendAttributedString:str];
            
        }else if([name isEqualToString:@"a"]) //链接
        {
            NSDictionary *attributeDic = childElement.attributes;
            NSString *href = attributeDic[@"href"];
            
            if (childElement.children.count) {
                TFHppleElement *element = childElement.children[0];
                NSString *content = element.content;
                //            NSAttributedString *str = [[NSAttributedString alloc]initWithString:content attributes:@{NSForegroundColorAttributeName : PHRGBCOLOR(238, 194, 131), @"TAG" : @(YES), @"URL" : href, NSBackgroundColorAttributeName : (isReply ? PHRGBCOLOR(230, 230, 230) : PHClearColor)}];
                if (content.length) {
                    if ([self isMediaWithUrlLink:content]) {
                        KECLog(@"--content - %@",content);
                        NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
                        textAttachment.bounds = CGRectMake(0, 0, 240, 114);
                        textAttachment.image = [UIImage imageNamed:@"bg_video_play"];
                        
                        NSAttributedString *str = [NSAttributedString attributedStringWithAttachment:textAttachment];
//                        NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"sdfdsf"];
                        NSMutableAttributedString *mstr = [str mutableCopy];
                        [mstr addAttributes:@{@"TAG" : @(YES),  NSBaselineOffsetAttributeName : @10,NSLinkAttributeName : content} range:NSMakeRange(0, 1)];
                        NSAttributedString *nStr = [[NSAttributedString alloc]initWithString:@"\n\n"];
                        [attrStr appendAttributedString:nStr];
                        [attrStr appendAttributedString:mstr];
                        
                        
                    }else if([self isAudioWithUrlLink:content]){
                        NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
                        textAttachment.bounds = CGRectMake(0, 0, 295, 57);
                        textAttachment.image = [UIImage imageNamed:@"bg_audio_play"];
                        
                        NSAttributedString *str = [NSAttributedString attributedStringWithAttachment:textAttachment];
                        //                        NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"sdfdsf"];
                        NSMutableAttributedString *mstr = [str mutableCopy];
                        [mstr addAttributes:@{@"TAG" : @(YES),  NSBaselineOffsetAttributeName : @10,NSLinkAttributeName : content} range:NSMakeRange(0, 1)];
                        NSAttributedString *nStr = [[NSAttributedString alloc]initWithString:@"\n\n"];
                        [attrStr appendAttributedString:nStr];
                        [attrStr appendAttributedString:mstr];
                    
                    }else {
                        NSAttributedString *str = [[NSAttributedString alloc] initWithString:content attributes:@{NSForegroundColorAttributeName : RGB(59, 187, 238), NSFontAttributeName : [UIFont systemFontOfSize:15], NSUnderlineStyleAttributeName : @1, @"TAG" : @(YES), @"URL" : href, NSBaselineOffsetAttributeName : @7}];
                        [attrStr appendAttributedString:str];
                        
                    }
                }
            }
            
        }
        else if([name isEqualToString:@"div"])
        {
            NSArray *childElements = childElement.children;
            
            KECLog(@"A-indexPath - %@",indexPath);
            NSIndexPath *firstPath = [NSIndexPath indexPathForRow:0 inSection:0];
            
            NSAttributedString *str;
            BOOL isEqual = ([firstPath compare:indexPath] == NSOrderedSame) ? YES : NO;
            if (isEqual) {
                str = [self getAttrStringWith:childElements indexPath:indexPath isReply:NO];
                [attrStr appendAttributedString:str];
            }else{
                str = [self getAttrStringWith:childElements indexPath:indexPath isReply:NO];
                NSAttributedString *nStr = [[NSAttributedString alloc]initWithString:@"\n\n"];
                [attrStr appendAttributedString:str];
                [attrStr appendAttributedString:nStr];
            }            
        }
    }
    return attrStr;
}

- (NSArray *)rangesOfUrlInString:(NSString *)string
{
    NSError *error;
    NSString *regulaStr = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *arrayOfAllMatches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSTextCheckingResult *match in arrayOfAllMatches)
    {
        NSString* substringForMatch = [string substringWithRange:match.range];
        KECLog(@"text中的URL链接:%@---range:(%ld, %ld)", substringForMatch, match.range.location, match.range.length);
        [arrayM addObject:[NSValue valueWithRange:match.range]];
    }
    return arrayM;
}

- (void)moreButtonClicked{
//    BOOL isWalkingUser = [[KECDataManager dataManagerObjectForKey:WALKING_USER] boolValue];
//    if (isWalkingUser) {
//        KECLog(@"%d",isWalkingUser);
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"亲，你还未登录哦" message:@"登录就可以使用这个功能啦!" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"登录", nil];
//        [alert show];
//        return ;
//    }
//    [UIView animateWithDuration:0.3 animations:^{
//        self.shareView.hidden = NO;
//        self.shareView.y = 0;
//    }];
}

- (void)shareView:(KECShareView *)shareView didSelectedShareButtonWithIndex:(NSInteger)index{
    [self.shareView dismiss];
    
    NSString * shareUrl=[NSString stringWithFormat:@"http://bbs.61learn.com/forum.php?mod=viewthread&tid=%@",self.homePost.tid];
    KECShare *share = [[KECShare alloc] init];
    share.shareTitle = self.homePost.title;
    share.shareContent = self.homePost.message;
    share.shareUrl = shareUrl;
    share.shareIcon = [UIImage imageNamed:@"KEG_Logo"];
    
//    switch (index) {
//        case 0:{
//            [KECShareManager share:share toSnsName:UMShareToWechatSession inViewController:self];
//            break;
//        }
//        case 1:{
//            [KECShareManager share:share toSnsName:UMShareToWechatTimeline inViewController:self];
//            break;
//        }
//        case 2:{
//            [KECShareManager share:share toSnsName:UMShareToQQ inViewController:self];
//            break;
//        }
//        case 3:{
//            [KECShareManager share:share toSnsName:UMShareToSina inViewController:self];
//            break;
//        }
//        case 4:{
//            [KECShareManager share:share toSnsName:UMShareToQzone inViewController:self];
//            break;
//        }
//        case 5:{
//            [self clickStar];
//            break;
//        }
//        default:
//            break;
//    }
}

- (void)clickThreadDetailAvatarWithThreadDetail:(KECThreadDetail *)threadDetail{
//    KECProfileViewController *profileViewController = [[KECProfileViewController alloc] init];
//    profileViewController.userName = threadDetail.username;
//    profileViewController.uid = threadDetail.uid;
//    [self.navigationController pushViewController:profileViewController animated:YES];
}

#pragma KECThreadDetailHeaderViewDelegate
- (void)threadDetailHeaderView:(KECThreadDetailHeaderView *)headerView concerHost:(KECThreadDetail *)host{
    
//    KECProfileViewController *profileViewController = [[KECProfileViewController alloc] init];
//    profileViewController.userName = self.hostName;
//    profileViewController.uid = self.hostUid;
//    [self.navigationController pushViewController:profileViewController animated:YES];
}

- (void)threadDetailHeaderViewJumpToForum{
//    KECColumnHomeViewController *columnViewController = [[KECColumnHomeViewController alloc] init];
//    columnViewController.fid = self.threadDetail.fid;
//    [self.navigationController pushViewController:columnViewController animated:YES];
    
}

- (void)clickReplyTextFieldWithBottomBar:(KECReplyBottomBar *)bottomBar{
    BOOL isWalkingUser = [[KECDataManager dataManagerObjectForKey:WALKING_USER] boolValue];
    if (isWalkingUser) {
        KECLog(@"%d",isWalkingUser);
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"亲，你还未登录哦" message:@"登录就可以使用这个功能啦!" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"登录", nil];
        [alert show];
        return ;
    }
    
//    KECReplyViewController *replyViewController = [[KECReplyViewController alloc] init];
//    KECNavigationController *navi = [[KECNavigationController alloc]initWithRootViewController:replyViewController];
//    replyViewController.tid = self.tid;
//    replyViewController.subject = self.subject;
//    [self presentViewController:navi animated:YES completion:nil];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
//        KEGLoginViewController *loginViewController = [[KEGLoginViewController alloc] init];
//        [self.navigationController pushViewController:loginViewController animated:YES];
    }
}


- (void)threadDetail:(KECThreadDetail *)threadDetail didSelectedActionButtonWithIndex:(NSInteger)index{
    BOOL isWalkingUser = [[KECDataManager dataManagerObjectForKey:WALKING_USER] boolValue];
    if (isWalkingUser) {
        KECLog(@"%d",isWalkingUser);
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"亲，你还未登录哦" message:@"登录就可以使用这个功能啦!" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"登录", nil];
        [alert show];
        return ;
    }
    
    KECThreadDetailCell *hostThreadDetailCell = (KECThreadDetailCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    KECThreadDetail *hostThreadDetail = hostThreadDetailCell.threadDetail;
    switch (index) {
        case 0:
            [Statistics statisticClickEvent:CLICK_WARNNING_BUTTON];
            [self clickReport:threadDetail];
            break;
        case 1:
            [Statistics statisticClickEvent:CLICK_LIKE_DETAIL];
            [self clickThumb];
            break;
        case 2:{
//            [Statistics statisticClickEvent:CLICK_REPLAY_DETAIL];
//            KECReplyViewController *replyViewController = [[KECReplyViewController alloc] init];
//            replyViewController.tid = threadDetail.tid;
//            replyViewController.subject = self.replyMsg;
//            replyViewController.username = threadDetail.username;
//            if ([threadDetail.username isEqualToString:hostThreadDetail.username]) {
//                replyViewController.replyType = ReplyTypeHost;
//            }else{
//                replyViewController.replyType = ReplyTypeFloor;
//            }
//            KECNavigationController *navi = [[KECNavigationController alloc]initWithRootViewController:replyViewController];
//            [self presentViewController:navi animated:YES completion:nil];
        }
            break;
        case 3:{
            [UIView animateWithDuration:0.3 animations:^{
                self.shareView.hidden = NO;
                self.shareView.y = 0;
            }];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark 底部view代理方法
-  (void)clickPageButtonWithBottomBar:(KECReplyBottomBar *)bottomBar{
    [self.view.window addSubview:self.pageImageView];
    [self.view.window insertSubview:self.coverView belowSubview:self.pageImageView];
}

- (void)tapCoverView:(UITapGestureRecognizer *)tapGest
{
    [self.pageImageView removeFromSuperview];
    [self.coverView removeFromSuperview];
}

#pragma mark GZQPageVC代理方法
- (void)pageVC:(GZQPageVC *)pageVC didClickedHeaderOrFooterButton:(UIButton *)button
{
    [self.pageImageView removeFromSuperview];
    [self.coverView removeFromSuperview];
    
    [KECHubView showHubWithText:@"正在跳转" AddedTo:self.view];
    if ([button.currentTitle isEqualToString:@"首页"]) {
//        [self getDetailDataIsFirstTimeLoad:NO withPage:1 isJump:YES isPullUp:NO isPullDown:NO];
        [self requestThreadDetailsDataWithPage:1 isPull:YES];

    }else {
//        [self getDetailDataIsFirstTimeLoad:NO withPage:self.pageCount isJump:YES isPullUp:NO isPullDown:NO];
        [self requestThreadDetailsDataWithPage:self.pageCount isPull:NO];
    }
}

- (void)pageVC:(GZQPageVC *)pageVC didSelectedCellOfIndex:(NSInteger)index
{
    [self.pageImageView removeFromSuperview];
    [self.coverView removeFromSuperview];
    
    //    [MBProgressHUD showMessage:@"正在跳转" toView:self.view];
    [KECHubView showHubWithText:@"正在跳转" AddedTo:self.view];
    //    [self getDetailDataIsFirstTimeLoad:NO withPage:index + 1 isJump:YES isPullUp:NO isPullDown:NO];
    self.page = index + 1;
    [self requestThreadDetailsDataWithPage:index + 1 isPull:NO];
    
}

- (void)clickThumb{
    NSIndexPath *firstIndex = [NSIndexPath indexPathForRow:0 inSection:0];
    KECThreadDetailCell *cell = (KECThreadDetailCell *)[self.tableView cellForRowAtIndexPath:firstIndex];
    NSString *uid = [KECDataManager dataManagerObjectForKey:USER_ID];
    NSString *token = [KECDataManager dataManagerObjectForKey:USER_TOKEN];
    NSString *tid = self.tid;
    NSDictionary *param=@{@"uid":uid,
                          @"token":token,
                          @"tid":tid,
                          @"type":@"thread"};
    [KECFourmManager thumbWithParameters:param onCompletion:^(id responseObj) {
        NSInteger code = [responseObj[@"res"][@"code"] integerValue];
        if (code == 1) {
            [KECHubView showHubWithText:@"点赞成功" AddedTo:self.view];
            cell.likeButton.selected = YES;
        }else{
            NSString *msg = responseObj[@"res"][@"msg"];
            [KECHubView showHubWithText:msg AddedTo:self.view];
        }
    } onError:^(NSError *error) {
        [KECHubView showHubWithText:@"暂时无法请求数据" AddedTo:self.view];
    }];
}

- (void)clickReport:(KECThreadDetail *)threadDetail{
    NSString *uid = [KECDataManager dataManagerObjectForKey:USER_ID];
    NSString *token = [KECDataManager dataManagerObjectForKey:USER_TOKEN];
    NSString *qid = threadDetail.uid;
    
    if ([uid isEqualToString:qid]) {
        [KECHubView showHubWithText:@"不能举报自己" AddedTo:self.view];
        return;
    }
    
    NSDictionary *param=@{@"uid":uid,
                          @"token":token,
                          @"buid":qid,
                          @"rtype":@"user"};
    
    [KECHubView showHubWithStatus:@"正在举报"];
    [KECFourmManager reportWithParameters:param onCompletion:^(id responseObj) {
        [KECHubView dismiss];
        NSInteger code = [responseObj[@"res"][@"code"] integerValue];
        if (code == 1) {
            [KECHubView showHubWithText:@"举报成功" AddedTo:self.view];
        }else{
            NSString *msg = responseObj[@"res"][@"msg"];
            [KECHubView showHubWithText:msg AddedTo:self.view];
        }
    } onError:^(NSError *error) {
        [KECHubView dismiss];
        [KECHubView showHubWithText:@"举报失败" AddedTo:self.view];
    }];
}

- (void)clickStar{
    NSString *uid = [KECDataManager dataManagerObjectForKey:USER_ID];
    NSString *token = [KECDataManager dataManagerObjectForKey:USER_TOKEN];
    
    NSDictionary *param=@{@"uid":uid,
                          @"token":token,
                          @"id":self.tid,
                          @"type":@"thread"};
    
    [KECHubView showHubWithStatus:@"正在收藏"];
    [KECFourmManager starTopicWithParameters:param onCompletion:^(id responseObj) {
        [KECHubView dismiss];
        NSInteger code = [responseObj[@"res"][@"code"] integerValue];
        if (code == 1) {
            [KECHubView showHubWithText:@"收藏成功" AddedTo:self.view];
        }else{
            NSString *msg = responseObj[@"res"][@"msg"];
            [KECHubView showHubWithText:msg AddedTo:self.view];
        }
    } onError:^(NSError *error) {
        [KECHubView dismiss];
        [KECHubView showHubWithText:@"收藏失败" AddedTo:self.view];
    }];
}

- (void)replySuccee:(NSNotification *)noti{
    self.replySucceed = YES;
}

- (void)reSetTitleBarView
{
    self.topButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.topButton setTitle:@"全部" forState:UIControlStateNormal];
    [self.topButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.topButton addTarget:self action:@selector(selectTypeOfData) forControlEvents:UIControlEventTouchUpInside];
    [self.topButton setImage:[UIImage imageNamed:@"top_arrow"] forState:UIControlStateNormal];
    self.topButton.frame = CGRectMake(0, 0, 100, 21);
    self.topButton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    self.navigationItem.titleView = self.topButton;
}

//- (void)selectTypeOfData{
//    _typeView.hidden = !_typeView.hidden;
//}

- (void)requsetTypeDataWithType:(NSString *)type
{
    self.dataType = type;
    
    if([type isEqualToString:@"all"]){
        [self.topButton setTitle:@"全部" forState:UIControlStateNormal];
    }else{
        [self.topButton setTitle:@"楼主" forState:UIControlStateNormal];
    }
    
    [self requestThreadDetailsDataWithPage:1 isPull:YES];
//    _typeView.hidden = YES;
}

- (void)handleTap:(UITapGestureRecognizer *)tapGest
{
    UITextView *textView = (UITextView *)tapGest.view;
    NSLayoutManager *layoutManager = textView.layoutManager;
    
    CGPoint location = [tapGest locationInView:textView];
    location.x -= textView.textContainerInset.left;
    location.y -= textView.textContainerInset.top;
    
    NSUInteger characterIndex = [layoutManager characterIndexForPoint:location inTextContainer:textView.textContainer fractionOfDistanceBetweenInsertionPoints:NULL];
    if (characterIndex < textView.textStorage.length)
    {
        NSRange range;
        NSDictionary *attributes = [textView.textStorage attributesAtIndex:characterIndex effectiveRange:&range];
        if ([attributes objectForKey:@"TAG"]) //点击链接
        {
            NSString *urlStr = [attributes objectForKey:@"URL"];
            KECLog(@"url - %@",urlStr);
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
        }else if([attributes objectForKey:@"IMAGE"])//点击图片
        {
             KECLog(@"iamge -");
        }
        
        if ([attributes objectForKey:@"JZ"]) //点击链接
        {
            NSString *urlStr = [attributes objectForKey:@"URL"];
            KECLog(@"url - %@",urlStr);
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
        }
        

     }
    
}

- (void)dealloc{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:KECBackToPostNotification object:nil];
}

- (void)back{
    if (self.isFromPost) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (BOOL)isMediaWithUrlLink:(NSString *)link {
   
    BOOL isMedia = NO;
    if ([link hasSuffix:@"mp4"]||[link hasSuffix:@"wmv"]||[link hasSuffix:@"avi"]||[link hasSuffix:@"rmvb"]||[link hasSuffix:@"3gp"]||[link hasSuffix:@"swf"]||[link hasSuffix:@"flv"] ) {
        isMedia = YES;
    }
    return isMedia;
}

- (BOOL)isAudioWithUrlLink:(NSString *)link {
    BOOL isAudio = NO;
    if ([link hasSuffix:@"mp3"]) {
        isAudio = YES;
    }
    return isAudio;
}
                         
@end
