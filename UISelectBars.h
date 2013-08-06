//
//  UISelectBars.h
//  xiguateng
//
//  Created by apple on 12-10-16.
//  Copyright (c) 2012年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UISelectBarsDelegate

@required
-(void)selectBarsChange:(NSInteger)index;

@end

@interface UISelectBars : UIView

@property(nonatomic,strong)id<UISelectBarsDelegate>delegate;

- (id)initWithFrame:(CGRect)frame NormalImgs:(NSArray*)NormalImgs SelectImgs:(NSArray*)SelectImgs BarTitle:(NSArray*)BarTitle
         unSelColor:(UIColor*)unSelColor selColor:(UIColor*)selColor font:(UIFont*)font;
-(void)setBtnTitles:(NSMutableArray*)titles;

@end
