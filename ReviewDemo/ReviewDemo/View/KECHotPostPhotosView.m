//
//  KECHotPostPhotosView.m
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/6/22.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import "KECHotPostPhotosView.h"
#import "KECPhoto.h"
#import "MWPhoto.h"
#import "MWPhotoBrowser.h"


#define kPhotoViewWH (APP_WIDTH - 100) / 3
#define kOnePhotoViewWH APP_WIDTH - 200
#define kPhotoViewMargin 10
//#define kPhotoViewMaxCol(count) ((count==4)?2:3)
#define kPhotoViewMaxCol(count) 3
@interface KECHotPostPhotosView ()
@property (nonatomic, strong) NSMutableArray *photoArray;

@end
@implementation KECHotPostPhotosView

- (NSMutableArray *)photoArray{
    if (!_photoArray) {
        _photoArray = [NSMutableArray array];
    }
    return _photoArray;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)setPhotos:(NSArray *)photos{
    
    _photos = photos;
    
    NSUInteger photosCount = photos.count;
    if (photosCount > 9) {
        photosCount = 9;
    }
    
    while (self.subviews.count <photosCount) {
        UIImageView *photoView = [[UIImageView alloc] init];
        photoView.contentMode = UIViewContentModeScaleAspectFill;
        photoView.clipsToBounds = YES;
        photoView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [photoView addGestureRecognizer:tap];
        [self addSubview:photoView];
    }
    
    for (int i = 0; i < self.subviews.count; i++) {
        UIImageView *photoView = self.subviews[i];
        
        if (i < photosCount) {
            photoView.hidden = NO;
            
            KECPhoto *photo = photos[i];
            NSString *photoPre = @"http://bbs.61learn.com/data/attachment/forum/";
            NSString *photoViewUrl = [NSString stringWithFormat:@"%@/%@",photoPre,photo.attachment];
            [photoView setImageViewWithUrlString:photoViewUrl];
            photoView.tag = i;
            
            
        }else{
            photoView.hidden = YES;
        }
    }
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    NSUInteger photosCount = self.photos.count;
    if (photosCount > 3) {
        photosCount = 3;
    }
    if(photosCount == 1){
        UIImageView *photoView = self.subviews[0];
        photoView.frame = CGRectMake(0, 0, kOnePhotoViewWH, kOnePhotoViewWH);
        return;
    }
    NSUInteger maxCol = kPhotoViewMaxCol(photosCount);
    for (int i = 0; i < photosCount ; i++) {
        UIImageView *photoView = self.subviews[i];
        
        NSUInteger col = i % maxCol;
        photoView.x = col * (kPhotoViewWH + kPhotoViewMargin);
        
        NSUInteger row = i / maxCol;
        photoView.y = row * (kPhotoViewWH + kPhotoViewMargin);
        photoView.width = kPhotoViewWH;
        photoView.height = kPhotoViewWH;
    }
}

+ (CGSize)sizeWithCount:(NSUInteger)count{
    
    if(count == 1){
        return CGSizeMake(kOnePhotoViewWH, kOnePhotoViewWH);
    }
    
    if (count > 3) {
        count = 3;
    }
    NSUInteger maxCols = kPhotoViewMaxCol(count);
    
    NSUInteger cols = (count >= maxCols)? maxCols : count;
    CGFloat photoW = cols * kPhotoViewWH+ (cols -1) * kPhotoViewMargin;
    
    NSUInteger rows = (count + maxCols - 1) / maxCols;
    
    CGFloat photoH = rows *kPhotoViewWH+ (rows - 1) * kPhotoViewMargin;
    return CGSizeMake(photoW, photoH);
}

- (void)tap:(UITapGestureRecognizer*)recognizer{
    NSInteger index = recognizer.view.tag ;
    if (_delegate && [_delegate respondsToSelector:@selector(clickHotPostPhotosView:WithIndex: )]) {
        [_delegate clickHotPostPhotosView:self.photos WithIndex:index];
    }
}

@end
