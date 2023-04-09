
namespace DoAnATBM
{
    partial class FromMain
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.ButtonUsers = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.buttonViewUserPrivileges = new System.Windows.Forms.Button();
            this.buttonPrivileges = new System.Windows.Forms.Button();
            this.buttonAlterUser = new System.Windows.Forms.Button();
            this.buttonDropUser = new System.Windows.Forms.Button();
            this.buttonCreateUser = new System.Windows.Forms.Button();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.xem_quyen_btn = new System.Windows.Forms.Button();
            this.cap_thu_quyen = new System.Windows.Forms.Button();
            this.buttonViewRoles = new System.Windows.Forms.Button();
            this.buttonCreateRole = new System.Windows.Forms.Button();
            this.buttonChangePW = new System.Windows.Forms.Button();
            this.buttonDropRole = new System.Windows.Forms.Button();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.buttonViewData = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.SuspendLayout();
            // 
            // ButtonUsers
            // 
            this.ButtonUsers.Location = new System.Drawing.Point(20, 30);
            this.ButtonUsers.Name = "ButtonUsers";
            this.ButtonUsers.Size = new System.Drawing.Size(220, 32);
            this.ButtonUsers.TabIndex = 0;
            this.ButtonUsers.Text = "Xem danh sách";
            this.ButtonUsers.UseVisualStyleBackColor = true;
            this.ButtonUsers.Click += new System.EventHandler(this.ButtonUsers_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.buttonViewUserPrivileges);
            this.groupBox1.Controls.Add(this.buttonPrivileges);
            this.groupBox1.Controls.Add(this.buttonAlterUser);
            this.groupBox1.Controls.Add(this.buttonDropUser);
            this.groupBox1.Controls.Add(this.buttonCreateUser);
            this.groupBox1.Controls.Add(this.ButtonUsers);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(256, 278);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Người dùng:";
            // 
            // buttonViewUserPrivileges
            // 
            this.buttonViewUserPrivileges.Location = new System.Drawing.Point(20, 230);
            this.buttonViewUserPrivileges.Name = "buttonViewUserPrivileges";
            this.buttonViewUserPrivileges.Size = new System.Drawing.Size(220, 30);
            this.buttonViewUserPrivileges.TabIndex = 5;
            this.buttonViewUserPrivileges.Text = "Xem quyền";
            this.buttonViewUserPrivileges.UseVisualStyleBackColor = true;
            this.buttonViewUserPrivileges.Click += new System.EventHandler(this.buttonViewUserPrivileges_Click);
            // 
            // buttonPrivileges
            // 
            this.buttonPrivileges.Location = new System.Drawing.Point(20, 190);
            this.buttonPrivileges.Name = "buttonPrivileges";
            this.buttonPrivileges.Size = new System.Drawing.Size(220, 30);
            this.buttonPrivileges.TabIndex = 4;
            this.buttonPrivileges.Text = "Cấp/Thu hồi quyền";
            this.buttonPrivileges.UseVisualStyleBackColor = true;
            this.buttonPrivileges.Click += new System.EventHandler(this.buttonPrivileges_Click_1);
            // 
            // buttonAlterUser
            // 
            this.buttonAlterUser.Location = new System.Drawing.Point(20, 150);
            this.buttonAlterUser.Name = "buttonAlterUser";
            this.buttonAlterUser.Size = new System.Drawing.Size(220, 30);
            this.buttonAlterUser.TabIndex = 3;
            this.buttonAlterUser.Text = "Đổi mật khẩu";
            this.buttonAlterUser.UseVisualStyleBackColor = true;
            this.buttonAlterUser.Click += new System.EventHandler(this.buttonAlterUser_Click);
            // 
            // buttonDropUser
            // 
            this.buttonDropUser.Location = new System.Drawing.Point(20, 110);
            this.buttonDropUser.Name = "buttonDropUser";
            this.buttonDropUser.Size = new System.Drawing.Size(220, 30);
            this.buttonDropUser.TabIndex = 2;
            this.buttonDropUser.Text = "Xóa";
            this.buttonDropUser.UseVisualStyleBackColor = true;
            this.buttonDropUser.Click += new System.EventHandler(this.buttonDropUser_Click);
            // 
            // buttonCreateUser
            // 
            this.buttonCreateUser.Location = new System.Drawing.Point(20, 70);
            this.buttonCreateUser.Name = "buttonCreateUser";
            this.buttonCreateUser.Size = new System.Drawing.Size(220, 30);
            this.buttonCreateUser.TabIndex = 1;
            this.buttonCreateUser.Text = "Tạo mới";
            this.buttonCreateUser.UseVisualStyleBackColor = true;
            this.buttonCreateUser.Click += new System.EventHandler(this.ButtonCreateUser_Click);
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.xem_quyen_btn);
            this.groupBox2.Controls.Add(this.cap_thu_quyen);
            this.groupBox2.Controls.Add(this.buttonViewRoles);
            this.groupBox2.Controls.Add(this.buttonCreateRole);
            this.groupBox2.Controls.Add(this.buttonChangePW);
            this.groupBox2.Controls.Add(this.buttonDropRole);
            this.groupBox2.Location = new System.Drawing.Point(298, 12);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(256, 278);
            this.groupBox2.TabIndex = 5;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Role:";
            // 
            // xem_quyen_btn
            // 
            this.xem_quyen_btn.Location = new System.Drawing.Point(20, 229);
            this.xem_quyen_btn.Name = "xem_quyen_btn";
            this.xem_quyen_btn.Size = new System.Drawing.Size(220, 31);
            this.xem_quyen_btn.TabIndex = 9;
            this.xem_quyen_btn.Text = "Xem quyền";
            this.xem_quyen_btn.UseVisualStyleBackColor = true;
            this.xem_quyen_btn.Click += new System.EventHandler(this.xem_quyen_btn_Click);
            // 
            // cap_thu_quyen
            // 
            this.cap_thu_quyen.Location = new System.Drawing.Point(20, 190);
            this.cap_thu_quyen.Name = "cap_thu_quyen";
            this.cap_thu_quyen.Size = new System.Drawing.Size(220, 30);
            this.cap_thu_quyen.TabIndex = 6;
            this.cap_thu_quyen.Text = "Cấp/thu hồi quyền";
            this.cap_thu_quyen.UseVisualStyleBackColor = true;
            this.cap_thu_quyen.Click += new System.EventHandler(this.button_cap_thu_quyen);
            // 
            // buttonViewRoles
            // 
            this.buttonViewRoles.Location = new System.Drawing.Point(20, 32);
            this.buttonViewRoles.Name = "buttonViewRoles";
            this.buttonViewRoles.Size = new System.Drawing.Size(220, 30);
            this.buttonViewRoles.TabIndex = 7;
            this.buttonViewRoles.Text = "Xem Danh Sách";
            this.buttonViewRoles.UseVisualStyleBackColor = true;
            this.buttonViewRoles.Click += new System.EventHandler(this.buttonViewRoles_Click);
            // 
            // buttonCreateRole
            // 
            this.buttonCreateRole.Location = new System.Drawing.Point(20, 70);
            this.buttonCreateRole.Name = "buttonCreateRole";
            this.buttonCreateRole.Size = new System.Drawing.Size(220, 30);
            this.buttonCreateRole.TabIndex = 4;
            this.buttonCreateRole.Text = "Tạo mới";
            this.buttonCreateRole.UseVisualStyleBackColor = true;
            this.buttonCreateRole.Click += new System.EventHandler(this.buttonCreateRole_Click);
            // 
            // buttonChangePW
            // 
            this.buttonChangePW.Location = new System.Drawing.Point(20, 150);
            this.buttonChangePW.Name = "buttonChangePW";
            this.buttonChangePW.Size = new System.Drawing.Size(220, 30);
            this.buttonChangePW.TabIndex = 6;
            this.buttonChangePW.Text = "Đổi mật khẩu";
            this.buttonChangePW.UseVisualStyleBackColor = true;
            this.buttonChangePW.Click += new System.EventHandler(this.buttonChangePW_Click);
            // 
            // buttonDropRole
            // 
            this.buttonDropRole.Location = new System.Drawing.Point(20, 110);
            this.buttonDropRole.Name = "buttonDropRole";
            this.buttonDropRole.Size = new System.Drawing.Size(220, 30);
            this.buttonDropRole.TabIndex = 5;
            this.buttonDropRole.Text = "Xóa ";
            this.buttonDropRole.UseVisualStyleBackColor = true;
            this.buttonDropRole.Click += new System.EventHandler(this.buttonDropRole_Click);
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.buttonViewData);
            this.groupBox3.Location = new System.Drawing.Point(570, 10);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(240, 80);
            this.groupBox3.TabIndex = 6;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Bảng, view";
            // 
            // buttonViewData
            // 
            this.buttonViewData.Location = new System.Drawing.Point(20, 30);
            this.buttonViewData.Name = "buttonViewData";
            this.buttonViewData.Size = new System.Drawing.Size(200, 30);
            this.buttonViewData.TabIndex = 0;
            this.buttonViewData.Text = "Xem dữ liệu";
            this.buttonViewData.UseVisualStyleBackColor = true;
            this.buttonViewData.Click += new System.EventHandler(this.buttonViewData_Click);
            // 
            // FromMain
            // 
            this.AllowDrop = true;
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(830, 307);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.groupBox2);
            this.MaximizeBox = false;
            this.Name = "FromMain";
            this.Text = "Main";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FromMain_FormClosing);
            this.Load += new System.EventHandler(this.FromMain_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.groupBox3.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button ButtonUsers;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Button buttonCreateUser;
        private System.Windows.Forms.Button buttonDropUser;
        private System.Windows.Forms.Button buttonAlterUser;
        private System.Windows.Forms.Button buttonCreateRole;
        private System.Windows.Forms.Button buttonDropRole;
        private System.Windows.Forms.Button buttonViewRoles;
        private System.Windows.Forms.Button buttonChangePW;
        private System.Windows.Forms.Button xem_quyen_btn;
        private System.Windows.Forms.Button cap_thu_quyen;
        private System.Windows.Forms.Button buttonPrivileges;
        private System.Windows.Forms.Button buttonViewPrivs;
        private System.Windows.Forms.Button buttonViewUserPrivileges;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Button buttonViewData;
    }
}

