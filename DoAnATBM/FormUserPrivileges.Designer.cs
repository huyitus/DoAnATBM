
namespace DoAnATBM
{
    partial class FormUserPrivileges
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
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.textUser = new System.Windows.Forms.TextBox();
            this.textTable = new System.Windows.Forms.TextBox();
            this.checkGrantOption = new System.Windows.Forms.CheckBox();
            this.buttonSelect = new System.Windows.Forms.Button();
            this.buttonDelete = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.textColumn = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.buttonUpdate = new System.Windows.Forms.Button();
            this.buttonInsert = new System.Windows.Forms.Button();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.buttonRevokeSelect = new System.Windows.Forms.Button();
            this.buttonRevokeDelete = new System.Windows.Forms.Button();
            this.buttonRevokeInsert = new System.Windows.Forms.Button();
            this.buttonRevokeUpdate = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(20, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(112, 17);
            this.label1.TabIndex = 0;
            this.label1.Text = "Tên người dùng:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(20, 50);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(73, 17);
            this.label2.TabIndex = 1;
            this.label2.Text = "Tên bảng:";
            // 
            // textUser
            // 
            this.textUser.Location = new System.Drawing.Point(140, 20);
            this.textUser.Name = "textUser";
            this.textUser.Size = new System.Drawing.Size(190, 22);
            this.textUser.TabIndex = 2;
            // 
            // textTable
            // 
            this.textTable.Location = new System.Drawing.Point(140, 50);
            this.textTable.Name = "textTable";
            this.textTable.Size = new System.Drawing.Size(190, 22);
            this.textTable.TabIndex = 3;
            // 
            // checkGrantOption
            // 
            this.checkGrantOption.AutoSize = true;
            this.checkGrantOption.Location = new System.Drawing.Point(20, 30);
            this.checkGrantOption.Name = "checkGrantOption";
            this.checkGrantOption.Size = new System.Drawing.Size(138, 21);
            this.checkGrantOption.TabIndex = 4;
            this.checkGrantOption.Text = "With grant option";
            this.checkGrantOption.UseVisualStyleBackColor = true;
            // 
            // buttonSelect
            // 
            this.buttonSelect.Location = new System.Drawing.Point(20, 60);
            this.buttonSelect.Name = "buttonSelect";
            this.buttonSelect.Size = new System.Drawing.Size(190, 30);
            this.buttonSelect.TabIndex = 5;
            this.buttonSelect.Text = "Cấp quyền Select";
            this.buttonSelect.UseVisualStyleBackColor = true;
            this.buttonSelect.Click += new System.EventHandler(this.buttonSelect_Click);
            // 
            // buttonDelete
            // 
            this.buttonDelete.Location = new System.Drawing.Point(20, 100);
            this.buttonDelete.Name = "buttonDelete";
            this.buttonDelete.Size = new System.Drawing.Size(190, 30);
            this.buttonDelete.TabIndex = 6;
            this.buttonDelete.Text = "Cấp quyền Delete";
            this.buttonDelete.UseVisualStyleBackColor = true;
            this.buttonDelete.Click += new System.EventHandler(this.buttonDelete_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.textColumn);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.buttonUpdate);
            this.groupBox1.Controls.Add(this.buttonInsert);
            this.groupBox1.Location = new System.Drawing.Point(20, 140);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(440, 120);
            this.groupBox1.TabIndex = 14;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Insert, Update";
            // 
            // textColumn
            // 
            this.textColumn.Location = new System.Drawing.Point(80, 50);
            this.textColumn.Name = "textColumn";
            this.textColumn.Size = new System.Drawing.Size(100, 22);
            this.textColumn.TabIndex = 18;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(10, 50);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(60, 17);
            this.label5.TabIndex = 17;
            this.label5.Text = "Tên cột:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(190, 50);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(24, 17);
            this.label3.TabIndex = 16;
            this.label3.Text = "=>";
            // 
            // buttonUpdate
            // 
            this.buttonUpdate.Location = new System.Drawing.Point(240, 70);
            this.buttonUpdate.Name = "buttonUpdate";
            this.buttonUpdate.Size = new System.Drawing.Size(190, 30);
            this.buttonUpdate.TabIndex = 15;
            this.buttonUpdate.Text = "Cấp quyền Update";
            this.buttonUpdate.UseVisualStyleBackColor = true;
            this.buttonUpdate.Click += new System.EventHandler(this.buttonUpdate_Click);
            // 
            // buttonInsert
            // 
            this.buttonInsert.Location = new System.Drawing.Point(240, 30);
            this.buttonInsert.Name = "buttonInsert";
            this.buttonInsert.Size = new System.Drawing.Size(190, 30);
            this.buttonInsert.TabIndex = 14;
            this.buttonInsert.Text = "Cấp quyền Insert";
            this.buttonInsert.UseVisualStyleBackColor = true;
            this.buttonInsert.Click += new System.EventHandler(this.buttonInsert_Click);
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.checkGrantOption);
            this.groupBox2.Controls.Add(this.groupBox1);
            this.groupBox2.Controls.Add(this.buttonSelect);
            this.groupBox2.Controls.Add(this.buttonDelete);
            this.groupBox2.Location = new System.Drawing.Point(140, 80);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(480, 280);
            this.groupBox2.TabIndex = 15;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Cấp quyền";
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.buttonRevokeUpdate);
            this.groupBox3.Controls.Add(this.buttonRevokeInsert);
            this.groupBox3.Controls.Add(this.buttonRevokeDelete);
            this.groupBox3.Controls.Add(this.buttonRevokeSelect);
            this.groupBox3.Location = new System.Drawing.Point(640, 80);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(230, 280);
            this.groupBox3.TabIndex = 16;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Thu hồi quyền";
            // 
            // buttonRevokeSelect
            // 
            this.buttonRevokeSelect.Location = new System.Drawing.Point(20, 30);
            this.buttonRevokeSelect.Name = "buttonRevokeSelect";
            this.buttonRevokeSelect.Size = new System.Drawing.Size(190, 30);
            this.buttonRevokeSelect.TabIndex = 6;
            this.buttonRevokeSelect.Text = "Thu hồi quyền Select";
            this.buttonRevokeSelect.UseVisualStyleBackColor = true;
            this.buttonRevokeSelect.Click += new System.EventHandler(this.buttonRevokeSelect_Click);
            // 
            // buttonRevokeDelete
            // 
            this.buttonRevokeDelete.Location = new System.Drawing.Point(20, 70);
            this.buttonRevokeDelete.Name = "buttonRevokeDelete";
            this.buttonRevokeDelete.Size = new System.Drawing.Size(190, 30);
            this.buttonRevokeDelete.TabIndex = 7;
            this.buttonRevokeDelete.Text = "Thu hồi quyền Delete";
            this.buttonRevokeDelete.UseVisualStyleBackColor = true;
            this.buttonRevokeDelete.Click += new System.EventHandler(this.buttonRevokeDelete_Click);
            // 
            // buttonRevokeInsert
            // 
            this.buttonRevokeInsert.Location = new System.Drawing.Point(20, 110);
            this.buttonRevokeInsert.Name = "buttonRevokeInsert";
            this.buttonRevokeInsert.Size = new System.Drawing.Size(190, 30);
            this.buttonRevokeInsert.TabIndex = 8;
            this.buttonRevokeInsert.Text = "Thu hồi quyền Insert";
            this.buttonRevokeInsert.UseVisualStyleBackColor = true;
            this.buttonRevokeInsert.Click += new System.EventHandler(this.buttonRevokeInsert_Click);
            // 
            // buttonRevokeUpdate
            // 
            this.buttonRevokeUpdate.Location = new System.Drawing.Point(20, 150);
            this.buttonRevokeUpdate.Name = "buttonRevokeUpdate";
            this.buttonRevokeUpdate.Size = new System.Drawing.Size(190, 30);
            this.buttonRevokeUpdate.TabIndex = 9;
            this.buttonRevokeUpdate.Text = "Thu hồi quyền Update";
            this.buttonRevokeUpdate.UseVisualStyleBackColor = true;
            this.buttonRevokeUpdate.Click += new System.EventHandler(this.buttonRevokeUpdate_Click);
            // 
            // FormUserPrivileges
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(886, 380);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.textTable);
            this.Controls.Add(this.textUser);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.MaximizeBox = false;
            this.Name = "FormUserPrivileges";
            this.Text = "Cấp/thu hồi quyền người dùng";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FormUserPrivileges_FormClosing);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textUser;
        private System.Windows.Forms.TextBox textTable;
        private System.Windows.Forms.CheckBox checkGrantOption;
        private System.Windows.Forms.Button buttonSelect;
        private System.Windows.Forms.Button buttonDelete;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox textColumn;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button buttonUpdate;
        private System.Windows.Forms.Button buttonInsert;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Button buttonRevokeUpdate;
        private System.Windows.Forms.Button buttonRevokeInsert;
        private System.Windows.Forms.Button buttonRevokeDelete;
        private System.Windows.Forms.Button buttonRevokeSelect;
    }
}