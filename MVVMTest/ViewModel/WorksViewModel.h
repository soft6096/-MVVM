//
//  WorksViewModel.h
//  MVVMTest
//
//

#import "ViewModelClass.h"

@interface WorksViewModel : ViewModelClass {
    int _page;
    BOOL _isEnd;
    NSMutableArray *_worksData;
}
-(void)refresh:(BOOL)isHeader;
@end
