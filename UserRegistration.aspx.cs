using System;
using System.Web.UI.WebControls;

using DALayer;
using System.Data;

namespace InventoryManagmentSystem
{
    public partial class UserRegistration : System.Web.UI.Page
    {
          clsUser Dal = new clsUser();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["UserName"]==null)
            {
                Response.Redirect("Login.aspx");
            }
                if (!IsPostBack)
            {
                LoadGrid();
                ClearAll();
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            BLayer.User obj = InitalizeObject(-1);
            Dal.AddNewUser(obj);
            LoadGrid();
            ClearAll();
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            BLayer.User obj = new  BLayer.User();
            obj = InitalizeObject(Convert.ToInt16(ViewState["userId"]));
            Dal.UpdateUser(obj);
            LoadGrid();
            ClearAll();
      
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            BLayer.User obj = InitalizeObject(Convert.ToInt16(ViewState["userId"]));
            int userId = Convert.ToInt16(ViewState["userId"]);
            Dal.DeleteUser(userId);
            LoadGrid();
            ClearAll();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            GridViewRow row = GridView1.SelectedRow;
            ViewState["userId"]= hdnUserId.Value = row.Cells[1].Text;
            
            txtFullName.Text = row.Cells[2].Text;
            txtUserName.Text = row.Cells[3].Text;
            txtEmail.Text = row.Cells[4].Text;
            txtPassword.Attributes.Add("value", row.Cells[5].Text) ;
            txtConfirmpassword.Attributes.Add("value", row.Cells[5].Text);
            HiddenField hdnIsAdminType = (HiddenField)GridView1.Rows[GridView1.SelectedIndex].FindControl("hdnIsAdminType");
            rdobtnUserType.SelectedValue = hdnIsAdminType.Value;
            BtnSave.Enabled = false;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadGrid();
        }

        private BLayer.User InitalizeObject(int userid)
        {
            BLayer.User obj = new BLayer.User();
            obj.UserId = userid != -1  ? userid : 0;
            obj.username = txtUserName.Text;
            obj.email = txtEmail.Text;
            obj.FullName = txtFullName.Text;
            obj.password = txtPassword.Text;
            obj.IsAdmin = int.Parse("0"+rdobtnUserType.SelectedValue);
            return obj;
        }

        public void ClearAll()
        {
            txtFullName.Text = string.Empty;
            txtUserName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtConfirmpassword.Text = "";
            rdobtnUserType.SelectedValue = null;
            BtnSave.Enabled = true;
        }
        private void LoadGrid()
        {
            DataSet users = Dal.LoadUser();
            GridView1.DataSource = users.Tables[0];
            GridView1.DataBind();// showing all register user in list
        }
    }
}