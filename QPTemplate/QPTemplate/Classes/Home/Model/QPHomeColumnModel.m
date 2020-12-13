//
//  QPHomeColumnModel.m
//  QPTemplate
//
//  Created by JackieQu on 2020/12/14.
//

#import "QPHomeColumnModel.h"

@implementation QPHomeColumnModel

+ (NSDictionary *)mj_objectClassInArray {
    
    return @{
        @"columnList" : @"QPColumnItemModel",
    };
}
+ (instancetype)homeColumnModel {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"QPHomeColumn" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    QPHomeColumnModel *columnModel = [QPHomeColumnModel modelWithDict:dict];
    
    NSMutableArray *columnArr = [NSMutableArray array];
    NSArray *columnList = columnModel.columnList;
    for (QPColumnItemModel *columnModel in columnList) {
        Class cls = NSClassFromString(columnModel.vcName);
        if (columnModel.show && cls && !isNullStr(columnModel.vcTitle)) {
            columnModel.cls = cls;
            [columnArr addObject:columnModel];
        }
    }
    columnModel.availableColumnArr = columnArr;
    if (columnModel.defaultIndex > columnArr.count - 1) {
        columnModel.defaultIndex = 0;
    }
    
    return columnModel;
}

@end

@implementation QPColumnItemModel

@end
