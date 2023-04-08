
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
            this.buttonAlterUser = new System.Windows.Forms.Button();
            this.buttonDropUser = new System.Windows.Forms.Button();
            this.buttonCreateUser = new System.Windows.Forms.Button();
            this.buttonCreateRole = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
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
<<<<<<< HEAD
            //
=======
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.buttonAlterUser);
            this.groupBox1.Controls.Add(this.buttonDropUser);
            this.groupBox1.Controls.Add(this.buttonCreateUser);
            this.groupBox1.Controls.Add(this.ButtonUsers);
            this.groupBox1.Location = new System.Drawing.Point(10, 10);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(256, 244);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Người dùng:";
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
            // buttonCreateRole
            // 
            this.buttonCreateRole.Location = new System.Drawing.Point(393, 42);
            this.buttonCreateRole.Name = "buttonCreateRole";
            this.buttonCreateRole.Size = new System.Drawing.Size(220, 30);
            this.buttonCreateRole.TabIndex = 4;
            this.buttonCreateRole.Text = "Tạo role";
            this.buttonCreateRole.UseVisualStyleBackColor = true;
            this.buttonCreateRole.Click += new System.EventHandler(this.buttonCreateRole_Click);

            // 
>>>>>>> 1a5b3a851549ecb1e8baa8c4163f3a155f2b9092
            // FromMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.buttonCreateRole);
            this.Name = "FromMain";
            this.Text = "Main";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FromMain_FormClosing);
            this.Load += new System.EventHandler(this.FromMain_Load);
            this.groupBox1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button ButtonUsers;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button buttonCreateUser;
        private System.Windows.Forms.Button buttonDropUser;
        private System.Windows.Forms.Button buttonAlterUser;
        private System.Windows.Forms.Button buttonCreateRole;

    }
}

