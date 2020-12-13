//
//  QPHomeTitleListView.m
//  QPTemplate
//
//  Created by JackieQu on 2020/12/13.
//

#import "QPHomeTitleListView.h"

@interface QPHomeTitleListView ()

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) NSMutableArray *btnArr;

@end

@implementation QPHomeTitleListView

- (UIView *)lineView {
    
    if (!_lineView) {
        CGFloat lineH = SCALE(2);
        CGFloat lineY = self.height - lineH - SCALE(1);
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, lineY, 0, lineH)];
        _lineView.backgroundColor = kMainColor;
    }
    return _lineView;
}

- (NSMutableArray *)btnArr {
    
    if (!_btnArr) {
        _btnArr = [NSMutableArray array];
    }
    return _btnArr;
}

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles {
    
    if (self = [super initWithFrame:frame]) {
        
        [self addBtnWithTitles:titles];
    }
    return self;
}

- (void)setTitles:(NSArray *)titles {
    _titles = titles;
    
    [self addBtnWithTitles:titles];
}

- (void)addBtnWithTitles:(NSArray *)titles {
    
    CGFloat btnW = self.width / titles.count;
    CGFloat btnH = self.height;
    
    for (NSInteger i = 0; i < titles.count; i ++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(btnW * i, 0, btnW, btnH);
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:kBlackColor forState:UIControlStateNormal];
        [btn setTitleColor:kMainColor forState:UIControlStateSelected];
        btn.titleLabel.font = kFontSize(18);
        btn.tag = i;
        [btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [self.btnArr addObject:btn];
        
        if (i == 1) {
            
            [btn.titleLabel sizeToFit];
            self.lineView.width = btn.titleLabel.width;
            self.lineView.centerX = btn.centerX;
            [self addSubview:self.lineView];
        }
    }
}

- (void)clickAction:(UIButton *)button {
    
    [self updateUIWithSelectedBtn:button];
    
    if (self.selectBlock) {
        self.selectBlock(button.tag);
    }
}

- (void)scrollToIndex:(NSInteger)index {
    
    UIButton *button = self.btnArr[index];
    [self updateUIWithSelectedBtn:button];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.lineView.centerX = button.centerX;
    }];
}

- (void)updateUIWithSelectedBtn:(UIButton *)selectedBtn {
    
    for (UIButton *btn in self.btnArr) {
        btn.selected = [btn isEqual:selectedBtn];
        btn.titleLabel.font = btn.selected ? kFontSize(20) : kFontSize(18);
        [btn.titleLabel sizeToFit];
        self.lineView.width = btn.titleLabel.width;
    }
}

@end
