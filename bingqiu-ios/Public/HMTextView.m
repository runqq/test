//
//  HMTextView.m
//  HireMe
//
//  Created by 曹晓琦 on 16/2/17.
//  Copyright © 2016年 LaiZuWoBa. All rights reserved.
//


#import "HMTextView.h"

@interface HMTextView ()

@property (nonatomic, weak) UILabel *placeholderLabel;

@end


@implementation HMTextView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        UILabel *placeholderLabel = [[UILabel alloc]init];
        placeholderLabel.textColor = [UIColor lightGrayColor];
        placeholderLabel.hidden = YES;
        placeholderLabel.numberOfLines = 0;
        placeholderLabel.backgroundColor = [UIColor clearColor];
        [self insertSubview:placeholderLabel atIndex:0];
        self.placeholderLabel = placeholderLabel;
       
        //监听placeholder
        NSNotificationCenter *notification = [NSNotificationCenter defaultCenter];
        [notification addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
    }

    return self;
}


- (void)setPlaceholder:(NSString *)placeholder{

    self.placeholderLabel.text = placeholder;
    if (placeholder.length) {
    
        //算出placeholder的文字宽度
        CGSize size = CGSizeMake(self.frame.size.width, MAXFLOAT);
        CGRect placeholderSize = [placeholder boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.placeholderLabel.font} context:nil];
        self.placeholderLabel.frame = CGRectMake( 5 , 4, placeholderSize.size.width , placeholderSize.size.height);
        self.placeholderLabel.hidden = NO;
        
    }else{
    
        self.placeholderLabel.hidden = YES;
    }

}


- (void)textDidChange{
    
    self.placeholderLabel.hidden = (self.text.length != 0);

}

- (void)setFont:(UIFont *)font{
    
    [super setFont:font];
    
    self.placeholderLabel.font = font;

}

- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    
    _placeholderColor = placeholderColor;
    
    self.placeholderLabel.textColor = placeholderColor;
}

- (void)dealloc{

    NSNotificationCenter *notification = [NSNotificationCenter defaultCenter];
    [notification removeObserver:self];
}

@end
