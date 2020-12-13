//
//  QPHomeTableViewCell.h
//  QPTemplate
//
//  Created by JackieQu on 2020/12/13.
//

#import "QPBaseTableViewCell.h"
#import "QPHomeCellFrame.h"

NS_ASSUME_NONNULL_BEGIN

@interface QPHomeTableViewCell : QPBaseTableViewCell

@property (nonatomic, strong) QPHomeCellFrame *cellFrame;

@end

NS_ASSUME_NONNULL_END
