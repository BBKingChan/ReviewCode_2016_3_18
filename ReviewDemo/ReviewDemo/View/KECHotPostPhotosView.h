//
//  KECHotPostPhotosView.h
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/6/22.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KECHotPostPhotosView;

@protocol KECHotPostPhotosViewDelegate <NSObject>

- (void)clickHotPostPhotosView:(NSArray *)photos WithIndex:(NSInteger)index;

@end

@interface KECHotPostPhotosView : UIView
@property (nonatomic, strong) NSArray *photos;
@property (nonatomic, weak) id<KECHotPostPhotosViewDelegate> delegate;

+ (CGSize)sizeWithCount:(NSUInteger)count;
@end
