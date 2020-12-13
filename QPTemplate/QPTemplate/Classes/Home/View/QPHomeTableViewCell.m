//
//  QPHomeTableViewCell.m
//  QPTemplate
//
//  Created by JackieQu on 2020/12/13.
//

#import "QPHomeTableViewCell.h"

@interface QPHomeTableViewCell ()

@property (nonatomic, strong) UIImageView *headImgView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *contentImgView;
@property (nonatomic, strong) UIView *topiceListView;
@property (nonatomic, strong) UIView *tagListView;
@property (nonatomic, strong) UIView *toolListView;

@end

@implementation QPHomeTableViewCell

- (UIImageView *)headImgView {
    
    if (!_headImgView) {
        _headImgView = [[UIImageView alloc] init];
        _headImgView.backgroundColor = kLightGrayColor;
    }
    return _headImgView;
}

- (UILabel *)nameLabel {
    
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = kBlackColor;
    }
    return _nameLabel;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = kBlackColor;
    }
    return _titleLabel;
}

- (UIImageView *)contentImgView {
    
    if (!_contentImgView) {
        _contentImgView = [[UIImageView alloc] init];
        _contentImgView.backgroundColor = kRandomColor;
    }
    return _contentImgView;
}

- (UIView *)toolListView {
    
    if (!_toolListView) {
        _toolListView = [[UIView alloc] init];
        _toolListView.backgroundColor = kLightGrayColor;
    }
    return _toolListView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.headImgView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.contentImgView];
        [self.contentView addSubview:self.toolListView];
    }
    return self;
}

- (void)setCellFrame:(QPHomeCellFrame *)cellFrame {
    _cellFrame = cellFrame;
    
    QPArticleModel *article = cellFrame.article;
    
    self.headImgView.frame = cellFrame.headImgViewFrame;
    self.headImgView.layer.cornerRadius = self.headImgView.width / 2;
    self.headImgView.layer.masksToBounds = YES;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:article.headURL] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            
    }];
    
    self.nameLabel.frame = cellFrame.nameLabelFrame;
    self.nameLabel.text = article.name;
    
    self.titleLabel.frame = cellFrame.titleLabelFrame;
    self.titleLabel.text = article.title;
    
    self.contentImgView.frame = cellFrame.contentImgViewFrame;
    [self.contentImgView sd_setImageWithURL:[NSURL URLWithString:article.imageURL] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            
    }] ;
    
    self.toolListView.frame = cellFrame.toolListViewFrame;
}

@end
