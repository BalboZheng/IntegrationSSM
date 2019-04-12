import com.gv.dao.DepartmentMapper;
import com.gv.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * 使用spring的单元测试，可以自动注入组件
 * 导入SpringTest模块
 * @ContextConfiguration 指定spring配置文件的位置
 * @Autowired
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private SqlSession sqlSession;


    @Test
    public void testcrud(){

        System.out.println(departmentMapper);
//
//        departmentMapper.insertSelective(new Department(null, "开发部"));
//        departmentMapper.insertSelective(new Department(null, "测试部"));
//        departmentMapper.insertSelective(new Department(null, "行政部"));
//
//        employeeMapper.insertSelective(new Employee(null, "Jerry", "M", "terry@google.com", 1));

//        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//        for (int i = 0; i <1000; i++){
//            String uid = UUID.randomUUID().toString().substring(0, 5) + i;
//            mapper.insertSelective(new Employee(null, uid, "M", uid+"@google.com", 1));
//        }
    }
}
