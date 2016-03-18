//
//  KECHomePostFrame.m
//  KidsEduCircl_2.0
//
//  Created by jiong23 on 15/6/18.
//  Copyright (c) 2015年 Chenjz. All rights reserved.
//

#import "KECHomePostFrame.h"
#import "KECHotPostPhotosView.h"
#import "TTTAttributedLabel.h"

@implementation KECHomePostFrame

- (void)setHomePost:(KECHomePost *)homePost{
    
    _homePost = homePost;
    NSInteger isAd = [homePost.isad integerValue];
    
    //头像
    CGFloat avatarX = kHomePostMargin * 1.5;
    CGFloat avatarY = kHomePostMargin * 1.5;
    CGFloat avatarW = kAvatarWH;
    CGFloat avatarH = kAvatarWH;
    _avatarFrame = CGRectMake(avatarX, avatarY, avatarW, avatarH);
    
    //名字
    CGFloat authorX = CGRectGetMaxX(_avatarFrame) + kHomePostMargin ;
    CGFloat authorY = avatarY;
    NSString *author = isAd > 0 ? homePost.adtitle : homePost.userinfo.username;
    CGSize authorSize= [author sizeWith:CGSizeMake(MAXFLOAT, 21) fontSize:kAuthorFontSize];
    CGFloat authorH = 21;
    _authorFrame = CGRectMake(authorX, authorY, authorSize.width, authorH);
    
    //标题
    CGFloat titleX = CGRectGetMaxX(_avatarFrame) + kHomePostMargin ;
    CGFloat titleY = CGRectGetMaxY(_authorFrame) + kHomePostBorder ;
    CGFloat titleW = APP_WIDTH - 3 *kHomePostMargin - kAvatarWH;
    CGSize titleSize= [homePost.title sizeWith:CGSizeMake(titleW, kLabelHeight * 2) fontSize:kTitleFontSize];
    _titleFrame = CGRectMake(titleX, titleY, titleW, titleSize.height);
    
    //性别图标
    CGFloat roleX = CGRectGetMaxX(_authorFrame);
    CGFloat roleY = authorY;
    CGFloat roleW = 12;
    CGFloat roleH = 12;
    _roleFrame = CGRectMake(roleX, roleY, roleW, roleH);
    
    //info图标
    CGFloat infoX = CGRectGetMaxX(_roleFrame) + kHomePostMargin ; ;
    CGFloat infoY = authorY;
    CGFloat infoW = 100;
    CGFloat infoH = 21;
    _infoFrame = CGRectMake(infoX, infoY, infoW, infoH);
    
    //指示图标
    CGFloat indicatorX = APP_WIDTH - 2 * kHomePostMargin ;
    CGFloat indicatorY = avatarY;
    CGFloat indicatorW = 8;
    CGFloat indicatorH = 14;
    _indicatorFrame = CGRectMake(indicatorX, indicatorY, indicatorW, indicatorH);
    
    //内容
    CGFloat messageX = titleX ;
    CGFloat messageY = CGRectGetMaxY(_titleFrame) + kHomePostBorder;
    CGFloat messageW = titleW;
    NSString *msg = [homePost.message stringByDecodingXMLEntities];
    NSString *newMessage = [NSString filterHTML2:[NSString filterHTML:msg]];
    
    NSString *m = isAd > 0 ? homePost.adcontent : newMessage;

    CGSize messageSize= [m sizeWith:CGSizeMake(messageW, 21*4) fontSize:kMessageFontSize];
    _messageFrame = (CGRect){{messageX, messageY}, messageSize};
    
//    NSAttributedString *message = [[NSAttributedString alloc]initWithString:newMessage];

//    CGSize  attrSize= [TTTAttributedLabel sizeThatFitsAttributedString:message
//                                                 withConstraints:CGSizeMake(messageW, MAXFLOAT)
//                                          limitedToNumberOfLines:4];
    _messageAttrFrame = (CGRect){{messageX, messageY}, messageSize};
    
    CGFloat bottomBarY = 0;
    
    //配图
    if (homePost.attachments.count) {
        CGFloat photoY = CGRectGetMaxY(_messageAttrFrame) + kHomePostBorder;
        CGFloat photoX = titleX;
        CGSize photoSize = [KECHotPostPhotosView sizeWithCount:homePost.attachments.count];
        _photosViewFrame = (CGRect){{photoX, photoY}, photoSize};
        bottomBarY = CGRectGetMaxY(_photosViewFrame) + kHomePostMargin * 3;
    }else{
        bottomBarY = CGRectGetMaxY(_messageAttrFrame) + kHomePostMargin * 3;
    }
    
    
    //底部工具条
    CGFloat bottomBarX = 0 ;
    CGFloat bottomBarW = APP_WIDTH;
    CGFloat bottomBarH = kBottomBarH;
     _bottomBarFrame = CGRectMake(bottomBarX, bottomBarY, bottomBarW, bottomBarH);
    
    //整体
    CGFloat containerX = 0;
    CGFloat containerY = 0;
    CGFloat containerW = APP_WIDTH;
    
    //广告
    if (isAd) {
        CGFloat adX = titleX;
        CGFloat adY = CGRectGetMaxY(_messageFrame) + kHomePostBorder;
        CGFloat adW = titleW;
        CGFloat adH = 380 * adW / 600;
        _adImageViewFrame = CGRectMake(adX, adY, adW, adH);
        
        //广告指示图标
        CGFloat indicatorX = APP_WIDTH - 53;
        CGFloat indicatorY = avatarY;
        CGFloat indicatorW = 53;
        CGFloat indicatorH = 20;
        _indicatorFrame = CGRectMake(indicatorX, indicatorY, indicatorW, indicatorH);
        
        //下载图标
        CGFloat downloadX = APP_WIDTH - 94 - kHomePostBorder;
        CGFloat downloadY = CGRectGetMaxY(_adImageViewFrame) + kHomePostBorder;;
        CGFloat downloadW = 94;
        CGFloat downloadH = 32;
        _downloadFrame = CGRectMake(downloadX, downloadY, downloadW, downloadH);
        
        NSInteger adType = [homePost.adtype integerValue];
        CGFloat containerH ;
        //广告类型 0＝直接打开网页 1＝下载App
        if (adType) {
            containerH = CGRectGetMaxY(_downloadFrame) + kHomePostMargin;
        } else{
            containerH = CGRectGetMaxY(_adImageViewFrame) + kHomePostMargin;
        }
        _containerFrame = CGRectMake(containerX, containerY, containerW, containerH);
        
    }else {
        CGFloat containerH = CGRectGetMaxY(_bottomBarFrame) + kHomePostMargin;
        _containerFrame = CGRectMake(containerX, containerY, containerW, containerH);
    }
    
    
    //分割线
    CGFloat lineViewX = 40;
    CGFloat lineViewY = CGRectGetMaxY(_containerFrame) - 1;
    CGFloat lineViewW = APP_WIDTH - lineViewX;
    CGFloat lineViewH = 1;
    _lineViewFrame = CGRectMake(lineViewX, lineViewY, lineViewW, lineViewH);
    
    //高度
    _height = CGRectGetMaxY(_containerFrame);

}

- (void)setThread:(KECThread *)thread {
    
    _thread = thread;
    NSInteger isAd = [thread.isad integerValue];
    
    //头像
    CGFloat avatarX = kHomePostMargin * 1.5;
    CGFloat avatarY = kHomePostMargin * 1.5;
    CGFloat avatarW = kAvatarWH;
    CGFloat avatarH = kAvatarWH;
    _avatarFrame = CGRectMake(avatarX, avatarY, avatarW, avatarH);
    
    //名字
    CGFloat authorX = CGRectGetMaxX(_avatarFrame) + kHomePostMargin ;
    CGFloat authorY = avatarY;
    NSString *author = isAd > 0 ? thread.adtitle : thread.userinfo.username;
    CGSize authorSize= [author sizeWith:CGSizeMake(MAXFLOAT, 21) fontSize:kAuthorFontSize];
    CGFloat authorH = 21;
    _authorFrame = CGRectMake(authorX, authorY, authorSize.width, authorH);
    
    //标题
    CGFloat titleX = CGRectGetMaxX(_avatarFrame) + kHomePostMargin ;
    CGFloat titleY = CGRectGetMaxY(_authorFrame) + kHomePostBorder ;
    CGFloat titleW = APP_WIDTH - 3 *kHomePostMargin - kAvatarWH;
    CGSize titleSize= [thread.subject sizeWith:CGSizeMake(titleW, kLabelHeight * 2) fontSize:kTitleFontSize];
    _titleFrame = CGRectMake(titleX, titleY, titleW, titleSize.height);
    
    //性别图标
    CGFloat roleX = CGRectGetMaxX(_authorFrame);
    CGFloat roleY = authorY;
    CGFloat roleW = 12;
    CGFloat roleH = 12;
    _roleFrame = CGRectMake(roleX, roleY, roleW, roleH);
    
    //info图标
    CGFloat infoX = CGRectGetMaxX(_roleFrame) + kHomePostMargin ; ;
    CGFloat infoY = authorY;
    CGFloat infoW = 100;
    CGFloat infoH = 21;
    _infoFrame = CGRectMake(infoX, infoY, infoW, infoH);
    
    //指示图标
    CGFloat indicatorX = APP_WIDTH - 2 * kHomePostMargin ;
    CGFloat indicatorY = avatarY;
    CGFloat indicatorW = 8;
    CGFloat indicatorH = 14;
    _indicatorFrame = CGRectMake(indicatorX, indicatorY, indicatorW, indicatorH);
    
    //内容
    CGFloat messageX = titleX ;
    CGFloat messageY = CGRectGetMaxY(_titleFrame) + kHomePostBorder;
    CGFloat messageW = titleW;
    NSString *msg = [thread.message stringByDecodingXMLEntities];
    NSString *newMessage = [NSString filterHTML2:[NSString filterHTML:msg]];
    
    NSString *m = isAd > 0 ? thread.adcontent : newMessage;
    
    CGSize messageSize= [m sizeWith:CGSizeMake(messageW, 21*4) fontSize:kMessageFontSize];
    _messageFrame = (CGRect){{messageX, messageY}, messageSize};
    
    //    NSAttributedString *message = [[NSAttributedString alloc]initWithString:newMessage];
    
    //    CGSize  attrSize= [TTTAttributedLabel sizeThatFitsAttributedString:message
    //                                                 withConstraints:CGSizeMake(messageW, MAXFLOAT)
    //                                          limitedToNumberOfLines:4];
    _messageAttrFrame = (CGRect){{messageX, messageY}, messageSize};
    
    CGFloat bottomBarY = 0;
    
    //配图
    if (thread.attachments.count) {
        CGFloat photoY = CGRectGetMaxY(_messageAttrFrame) + kHomePostBorder;
        CGFloat photoX = titleX;
        CGSize photoSize = [KECHotPostPhotosView sizeWithCount:thread.attachments.count];
        _photosViewFrame = (CGRect){{photoX, photoY}, photoSize};
        bottomBarY = CGRectGetMaxY(_photosViewFrame) + kHomePostMargin * 3;
    }else{
        bottomBarY = CGRectGetMaxY(_messageAttrFrame) + kHomePostMargin * 3;
    }
    
    
    //底部工具条
    CGFloat bottomBarX = 0 ;
    CGFloat bottomBarW = APP_WIDTH;
    CGFloat bottomBarH = kBottomBarH;
    _bottomBarFrame = CGRectMake(bottomBarX, bottomBarY, bottomBarW, bottomBarH);
    
    //整体
    CGFloat containerX = 0;
    CGFloat containerY = 0;
    CGFloat containerW = APP_WIDTH;
    
    //广告
    if (isAd) {
        CGFloat adX = titleX;
        CGFloat adY = CGRectGetMaxY(_messageFrame) + kHomePostBorder;
        CGFloat adW = titleW;
        CGFloat adH = 380 * adW / 600;
        _adImageViewFrame = CGRectMake(adX, adY, adW, adH);
        
        //广告指示图标
        CGFloat indicatorX = APP_WIDTH - 53;
        CGFloat indicatorY = avatarY;
        CGFloat indicatorW = 53;
        CGFloat indicatorH = 20;
        _indicatorFrame = CGRectMake(indicatorX, indicatorY, indicatorW, indicatorH);
        
        //下载图标
        CGFloat downloadX = APP_WIDTH - 94 - kHomePostBorder;
        CGFloat downloadY = CGRectGetMaxY(_adImageViewFrame) + kHomePostBorder;;
        CGFloat downloadW = 94;
        CGFloat downloadH = 32;
        _downloadFrame = CGRectMake(downloadX, downloadY, downloadW, downloadH);
        
        NSInteger adType = [thread.adtype integerValue];
        CGFloat containerH ;
        //广告类型 0＝直接打开网页 1＝下载App
        if (adType) {
            containerH = CGRectGetMaxY(_downloadFrame) + kHomePostMargin;
        } else{
            containerH = CGRectGetMaxY(_adImageViewFrame) + kHomePostMargin;
        }
        _containerFrame = CGRectMake(containerX, containerY, containerW, containerH);
        
    }else {
        CGFloat containerH = CGRectGetMaxY(_bottomBarFrame) + kHomePostMargin;
        _containerFrame = CGRectMake(containerX, containerY, containerW, containerH);
    }
    
    
    //分割线
    CGFloat lineViewX = 40;
    CGFloat lineViewY = CGRectGetMaxY(_containerFrame) - 1;
    CGFloat lineViewW = APP_WIDTH - lineViewX;
    CGFloat lineViewH = 1;
    _lineViewFrame = CGRectMake(lineViewX, lineViewY, lineViewW, lineViewH);
    
    //高度
    _height = CGRectGetMaxY(_containerFrame);
}


@end
