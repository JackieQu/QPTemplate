//
//  QPHomeTitleListView.h
//  QPTemplate
//
//  Created by JackieQu on 2020/12/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^TitleListSelectBlock)(NSInteger index);

@interface QPHomeTitleListView : UIView

@property (nonatomic, copy)   TitleListSelectBlock selectBlock;

@property (nonatomic, strong) NSArray *titles;

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;

- (void)scrollToIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
