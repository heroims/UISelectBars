//
//  UISelectBars.m
//  xiguateng
//
//  Created by apple on 12-10-16.
//  Copyright (c) 2012年 apple. All rights reserved.
//

#import "UISelectBars.h"

@implementation UISelectBars

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    } 
    return self;
}

- (id)initWithFrame:(CGRect)frame NormalImgs:(NSArray*)NormalImgs SelectImgs:(NSArray*)SelectImgs BarTitle:(NSArray*)BarTitle
unSelColor:(UIColor*)unSelColor selColor:(UIColor*)selColor font:(UIFont*)font{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSInteger barCount=[NormalImgs count];
        float btnWidth=self.frame.size.width/barCount;
        
        
        for (int i=0; i<barCount; i++) {
            UIButton *subBtn=[UIButton buttonWithType:UIButtonTypeCustom];
            [subBtn setTitle:BarTitle[i] forState:UIControlStateNormal];
            [subBtn setTitleColor:unSelColor forState:UIControlStateNormal];
            [subBtn setTitleColor:selColor forState:UIControlStateSelected];
            [subBtn.titleLabel setFont:font];
            [subBtn setBackgroundImage:[UIImage imageNamed:NormalImgs[i]] forState:UIControlStateNormal];
            [subBtn setBackgroundImage:[UIImage imageNamed:SelectImgs[i]] forState:UIControlStateSelected];
            subBtn.adjustsImageWhenHighlighted = NO;
            subBtn.tag=100+i;
            [subBtn addTarget:self action:@selector(subBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            subBtn.frame=CGRectMake(self.frame.size.width/barCount*i, 0, btnWidth, self.frame.size.height);
            [self addSubview:subBtn];
            
            if (i==0) {
                subBtn.selected=YES;
            }
        }

        // Initialization code
    }
    return self;
}

-(void)subBtnClick:(id)sender{
    NSInteger tag=((UIButton*)sender).tag%100;
    
    if (((UIButton*)sender).selected) {
        return;
    }
    for (UIButton *subBtn in self.subviews) {
        subBtn.selected=((UIButton*)sender).selected;
    }
    
    ((UIButton*)sender).selected=!((UIButton*)sender).selected;
    
    [_delegate selectBarsChange:tag];
}

-(void)setBtnTitles:(NSArray*)titles{
    for (int i=0; i<self.subviews.count; i++) {
        [self.subviews[i] setTitle:titles[i] forState:UIControlStateNormal];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
